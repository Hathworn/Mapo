; ModuleID = '../data/hip_kernels/7064/14/main.cu'
source_filename = "../data/hip_kernels/7064/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_share = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15gLogSoftmaxGradPfPKfS1_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
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

26:                                               ; preds = %100, %5
  ret void

27:                                               ; preds = %7, %100
  %28 = phi i32 [ 0, %7 ], [ %102, %100 ]
  %29 = add i32 %28, %8
  %30 = icmp slt i32 %29, %3
  br i1 %30, label %31, label %100

31:                                               ; preds = %27
  %32 = mul nsw i32 %29, %4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  store float 0.000000e+00, float addrspace(3)* %24, align 4, !tbaa !15
  br i1 %13, label %38, label %37

37:                                               ; preds = %48, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %25, label %66, label %52

38:                                               ; preds = %31, %48
  %39 = phi float [ %49, %48 ], [ 0.000000e+00, %31 ]
  %40 = phi i32 [ %50, %48 ], [ 0, %31 ]
  %41 = add i32 %40, %12
  %42 = icmp slt i32 %41, %4
  br i1 %42, label %43, label %48

43:                                               ; preds = %38
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %35, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !15
  %47 = fadd contract float %46, %39
  store float %47, float addrspace(3)* %24, align 4, !tbaa !15
  br label %48

48:                                               ; preds = %43, %38
  %49 = phi float [ %47, %43 ], [ %39, %38 ]
  %50 = add i32 %40, %18
  %51 = icmp slt i32 %50, %4
  br i1 %51, label %38, label %37, !llvm.loop !19

52:                                               ; preds = %37, %64
  %53 = phi i32 [ %55, %64 ], [ %18, %37 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = add nsw i32 %53, 1
  %55 = ashr i32 %54, 1
  %56 = ashr i32 %53, 1
  %57 = icmp ult i32 %12, %56
  br i1 %57, label %58, label %64

58:                                               ; preds = %52
  %59 = add nsw i32 %55, %12
  %60 = getelementptr inbounds float, float addrspace(3)* %23, i32 %59
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !15
  %62 = load float, float addrspace(3)* %24, align 4, !tbaa !15
  %63 = fadd contract float %61, %62
  store float %63, float addrspace(3)* %24, align 4, !tbaa !15
  br label %64

64:                                               ; preds = %58, %52
  %65 = icmp eq i32 %55, 1
  br i1 %65, label %66, label %52, !llvm.loop !21

66:                                               ; preds = %64, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %13, label %67, label %100

67:                                               ; preds = %66, %97
  %68 = phi i32 [ %98, %97 ], [ 0, %66 ]
  %69 = add i32 %68, %12
  %70 = icmp slt i32 %69, %4
  br i1 %70, label %71, label %97

71:                                               ; preds = %67
  %72 = sext i32 %69 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %35, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !15
  %75 = getelementptr inbounds float, float addrspace(1)* %36, i64 %72
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !15
  %77 = fmul float %76, 0x3FF7154760000000
  %78 = tail call float @llvm.rint.f32(float %77)
  %79 = fcmp ogt float %76, 0x40562E4300000000
  %80 = fcmp olt float %76, 0xC059D1DA00000000
  %81 = fneg float %77
  %82 = tail call float @llvm.fma.f32(float %76, float 0x3FF7154760000000, float %81)
  %83 = tail call float @llvm.fma.f32(float %76, float 0x3E54AE0BE0000000, float %82)
  %84 = fsub float %77, %78
  %85 = fadd float %83, %84
  %86 = tail call float @llvm.exp2.f32(float %85)
  %87 = fptosi float %78 to i32
  %88 = tail call float @llvm.amdgcn.ldexp.f32(float %86, i32 %87)
  %89 = select i1 %80, float 0.000000e+00, float %88
  %90 = select i1 %79, float 0x7FF0000000000000, float %89
  %91 = load float, float addrspace(3)* %23, align 4, !tbaa !15
  %92 = fmul contract float %91, %90
  %93 = fsub contract float %74, %92
  %94 = getelementptr inbounds float, float addrspace(1)* %34, i64 %72
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !15
  %96 = fadd contract float %95, %93
  store float %96, float addrspace(1)* %94, align 4, !tbaa !15
  br label %97

97:                                               ; preds = %71, %67
  %98 = add i32 %68, %18
  %99 = icmp slt i32 %98, %4
  br i1 %99, label %67, label %100, !llvm.loop !22

100:                                              ; preds = %97, %66, %27
  %101 = add i32 %19, %28
  %102 = add i32 %101, %22
  %103 = icmp slt i32 %102, %3
  br i1 %103, label %27, label %26, !llvm.loop !23
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
