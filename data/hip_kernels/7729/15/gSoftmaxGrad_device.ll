; ModuleID = '../data/hip_kernels/7729/15/main.cu'
source_filename = "../data/hip_kernels/7729/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_share = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12gSoftmaxGradPfPKfS1_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = icmp sgt i32 %3, 0
  br i1 %6, label %7, label %26

7:                                                ; preds = %5
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %13 = icmp sgt i32 %4, 0
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !4
  %17 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %16, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %16, %20
  %22 = zext i1 %21 to i32
  %23 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %18
  %24 = getelementptr inbounds float, float addrspace(3)* %23, i32 %12
  %25 = icmp eq i16 %17, 1
  br label %27

26:                                               ; preds = %91, %5
  ret void

27:                                               ; preds = %7, %91
  %28 = phi i32 [ 0, %7 ], [ %93, %91 ]
  %29 = add i32 %28, %8
  %30 = icmp slt i32 %29, %3
  br i1 %30, label %31, label %91

31:                                               ; preds = %27
  %32 = mul nsw i32 %29, %4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  store float 0.000000e+00, float addrspace(3)* %24, align 4, !tbaa !15
  br i1 %13, label %38, label %37

37:                                               ; preds = %51, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %25, label %69, label %55

38:                                               ; preds = %31, %51
  %39 = phi float [ %52, %51 ], [ 0.000000e+00, %31 ]
  %40 = phi i32 [ %53, %51 ], [ 0, %31 ]
  %41 = add i32 %40, %12
  %42 = icmp slt i32 %41, %4
  br i1 %42, label %43, label %51

43:                                               ; preds = %38
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %36, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !15
  %47 = getelementptr inbounds float, float addrspace(1)* %35, i64 %44
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !15
  %49 = fmul contract float %46, %48
  %50 = fadd contract float %39, %49
  store float %50, float addrspace(3)* %24, align 4, !tbaa !15
  br label %51

51:                                               ; preds = %43, %38
  %52 = phi float [ %50, %43 ], [ %39, %38 ]
  %53 = add i32 %40, %18
  %54 = icmp slt i32 %53, %4
  br i1 %54, label %38, label %37, !llvm.loop !19

55:                                               ; preds = %37, %67
  %56 = phi i32 [ %58, %67 ], [ %18, %37 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = add nsw i32 %56, 1
  %58 = ashr i32 %57, 1
  %59 = ashr i32 %56, 1
  %60 = icmp ult i32 %12, %59
  br i1 %60, label %61, label %67

61:                                               ; preds = %55
  %62 = add nsw i32 %58, %12
  %63 = getelementptr inbounds float, float addrspace(3)* %23, i32 %62
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !15
  %65 = load float, float addrspace(3)* %24, align 4, !tbaa !15
  %66 = fadd contract float %64, %65
  store float %66, float addrspace(3)* %24, align 4, !tbaa !15
  br label %67

67:                                               ; preds = %61, %55
  %68 = icmp eq i32 %58, 1
  br i1 %68, label %69, label %55, !llvm.loop !21

69:                                               ; preds = %67, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %13, label %70, label %91

70:                                               ; preds = %69, %88
  %71 = phi i32 [ %89, %88 ], [ 0, %69 ]
  %72 = add i32 %71, %12
  %73 = icmp slt i32 %72, %4
  br i1 %73, label %74, label %88

74:                                               ; preds = %70
  %75 = sext i32 %72 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %36, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !15
  %78 = getelementptr inbounds float, float addrspace(1)* %35, i64 %75
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !15
  %80 = load float, float addrspace(3)* %23, align 4, !tbaa !15
  %81 = fsub contract float %79, %80
  %82 = fmul contract float %77, %81
  %83 = fcmp contract une float %82, 0.000000e+00
  br i1 %83, label %84, label %88

84:                                               ; preds = %74
  %85 = getelementptr inbounds float, float addrspace(1)* %34, i64 %75
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !15
  %87 = fadd contract float %82, %86
  store float %87, float addrspace(1)* %85, align 4, !tbaa !15
  br label %88

88:                                               ; preds = %74, %84, %70
  %89 = add i32 %71, %18
  %90 = icmp slt i32 %89, %4
  br i1 %90, label %70, label %91, !llvm.loop !22

91:                                               ; preds = %88, %69, %27
  %92 = add i32 %19, %28
  %93 = add i32 %92, %22
  %94 = icmp slt i32 %93, %3
  br i1 %94, label %27, label %26, !llvm.loop !23
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !20}
