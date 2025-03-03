; ModuleID = '../data/hip_kernels/17576/19/main.cu'
source_filename = "../data/hip_kernels/17576/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10force_calcPfiiS_S_S_iiPif(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, i32 %6, i32 %7, i32 addrspace(1)* nocapture readonly %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = icmp ult i32 %11, %1
  %13 = icmp slt i32 %11, %1
  %14 = and i1 %12, %13
  br i1 %14, label %15, label %95

15:                                               ; preds = %10
  %16 = sdiv i32 %7, 2
  %17 = icmp sgt i32 %7, 1
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %19 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = icmp eq i32 %18, 0
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 4, !tbaa !4
  %26 = load i16, i16 addrspace(4)* %21, align 4, !range !13, !invariant.load !14
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %25, %27
  %29 = mul i32 %28, %27
  %30 = icmp ugt i32 %25, %29
  %31 = zext i1 %30 to i32
  br label %32

32:                                               ; preds = %15, %91
  %33 = phi i32 [ %11, %15 ], [ %93, %91 ]
  br i1 %17, label %35, label %34

34:                                               ; preds = %40, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %67, label %91

35:                                               ; preds = %32, %40
  %36 = phi i32 [ %41, %40 ], [ %16, %32 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp slt i32 %18, %36
  br i1 %37, label %38, label %40

38:                                               ; preds = %35
  %39 = mul nsw i32 %36, %6
  br label %43

40:                                               ; preds = %43, %35
  %41 = ashr i32 %36, 1
  %42 = icmp sgt i32 %36, 1
  br i1 %42, label %35, label %34, !llvm.loop !15

43:                                               ; preds = %38, %43
  %44 = phi i32 [ %18, %38 ], [ %65, %43 ]
  %45 = mul nsw i32 %44, %6
  %46 = add nsw i32 %45, %33
  %47 = add nsw i32 %46, %39
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !17
  %51 = sext i32 %46 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %3, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !17
  %54 = fadd contract float %50, %53
  store float %54, float addrspace(1)* %52, align 4, !tbaa !17
  %55 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !17
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !17
  %59 = fadd contract float %56, %58
  store float %59, float addrspace(1)* %57, align 4, !tbaa !17
  %60 = getelementptr inbounds float, float addrspace(1)* %5, i64 %48
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !17
  %62 = getelementptr inbounds float, float addrspace(1)* %5, i64 %51
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !17
  %64 = fadd contract float %61, %63
  store float %64, float addrspace(1)* %62, align 4, !tbaa !17
  %65 = add nsw i32 %44, %27
  %66 = icmp slt i32 %65, %36
  br i1 %66, label %43, label %40, !llvm.loop !21

67:                                               ; preds = %34
  %68 = sext i32 %33 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !22
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %91, label %72

72:                                               ; preds = %67
  %73 = getelementptr inbounds float, float addrspace(1)* %3, i64 %68
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !17
  %75 = fmul contract float %74, %9
  %76 = mul nsw i32 %33, 3
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  store float %75, float addrspace(1)* %78, align 4, !tbaa !17
  %79 = getelementptr inbounds float, float addrspace(1)* %4, i64 %68
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !17
  %81 = fmul contract float %80, %9
  %82 = add nsw i32 %76, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  store float %81, float addrspace(1)* %84, align 4, !tbaa !17
  %85 = getelementptr inbounds float, float addrspace(1)* %5, i64 %68
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !17
  %87 = fmul contract float %86, %9
  %88 = add nsw i32 %76, 2
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  store float %87, float addrspace(1)* %90, align 4, !tbaa !17
  br label %91

91:                                               ; preds = %67, %72, %34
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %92 = add i32 %28, %33
  %93 = add i32 %92, %31
  %94 = icmp slt i32 %93, %1
  br i1 %94, label %32, label %95, !llvm.loop !24

95:                                               ; preds = %91, %10
  ret void
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
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !16}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !19, i64 0}
!24 = distinct !{!24, !16}
