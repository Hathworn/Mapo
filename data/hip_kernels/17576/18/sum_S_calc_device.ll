; ModuleID = '../data/hip_kernels/17576/18/main.cu'
source_filename = "../data/hip_kernels/17576/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10sum_S_calcPfS_S_S_S_S_S_iiiffS_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 %9, float %10, float %11, float addrspace(1)* nocapture readonly %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = icmp slt i32 %14, %7
  br i1 %15, label %16, label %37

16:                                               ; preds = %13
  %17 = sdiv i32 %9, 2
  %18 = icmp sgt i32 %9, 1
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %20 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = icmp eq i32 %19, 0
  %24 = fneg contract float %10
  %25 = shl nsw i32 %7, 1
  %26 = icmp slt i32 %19, %8
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 12
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 4, !tbaa !4
  %30 = load i16, i16 addrspace(4)* %22, align 4, !range !13, !invariant.load !14
  %31 = zext i16 %30 to i32
  %32 = udiv i32 %29, %31
  %33 = mul i32 %32, %31
  %34 = icmp ugt i32 %29, %33
  %35 = zext i1 %34 to i32
  %36 = zext i16 %30 to i32
  br label %38

37:                                               ; preds = %88, %13
  ret void

38:                                               ; preds = %16, %88
  %39 = phi i32 [ %14, %16 ], [ %90, %88 ]
  %40 = mul nsw i32 %39, %9
  br i1 %18, label %47, label %41

41:                                               ; preds = %50, %38
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = sext i32 %40 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !15
  %45 = sext i32 %39 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  store float %44, float addrspace(1)* %46, align 4, !tbaa !15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %23, label %66, label %85

47:                                               ; preds = %38, %50
  %48 = phi i32 [ %51, %50 ], [ %17, %38 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp slt i32 %19, %48
  br i1 %49, label %53, label %50

50:                                               ; preds = %53, %47
  %51 = ashr i32 %48, 1
  %52 = icmp sgt i32 %48, 1
  br i1 %52, label %47, label %41, !llvm.loop !19

53:                                               ; preds = %47, %53
  %54 = phi i32 [ %64, %53 ], [ %19, %47 ]
  %55 = add i32 %54, %40
  %56 = add i32 %55, %48
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !15
  %60 = sext i32 %55 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !15
  %63 = fadd contract float %59, %62
  store float %63, float addrspace(1)* %61, align 4, !tbaa !15
  %64 = add nsw i32 %54, %36
  %65 = icmp slt i32 %64, %48
  br i1 %65, label %53, label %50, !llvm.loop !21

66:                                               ; preds = %41
  %67 = load float, float addrspace(1)* %46, align 4, !tbaa !15
  %68 = add nsw i32 %39, %7
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %6, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !15
  %72 = fsub contract float %67, %71
  %73 = getelementptr inbounds float, float addrspace(1)* %5, i64 %45
  %74 = fmul contract float %72, %24
  store float %74, float addrspace(1)* %73, align 4, !tbaa !15
  %75 = add nsw i32 %39, %25
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %6, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !15
  %79 = fadd contract float %74, %78
  store float %79, float addrspace(1)* %73, align 4, !tbaa !15
  %80 = getelementptr inbounds float, float addrspace(1)* %12, i64 %45
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !15
  %82 = fdiv contract float %11, %81
  %83 = fmul contract float %79, %82
  %84 = fadd contract float %83, %83
  store float %84, float addrspace(1)* %73, align 4, !tbaa !15
  br label %85

85:                                               ; preds = %66, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %86, label %88

86:                                               ; preds = %85
  %87 = getelementptr inbounds float, float addrspace(1)* %5, i64 %45
  br label %92

88:                                               ; preds = %92, %85
  %89 = add i32 %32, %39
  %90 = add i32 %89, %35
  %91 = icmp slt i32 %90, %7
  br i1 %91, label %38, label %37, !llvm.loop !22

92:                                               ; preds = %86, %92
  %93 = phi i32 [ %19, %86 ], [ %111, %92 ]
  %94 = load float, float addrspace(1)* %87, align 4, !tbaa !15
  %95 = fmul contract float %94, %10
  %96 = add nsw i32 %93, %40
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !15
  %100 = fmul contract float %99, %95
  store float %100, float addrspace(1)* %98, align 4, !tbaa !15
  %101 = load float, float addrspace(1)* %87, align 4, !tbaa !15
  %102 = fmul contract float %101, %10
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %97
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !15
  %105 = fmul contract float %104, %102
  store float %105, float addrspace(1)* %103, align 4, !tbaa !15
  %106 = load float, float addrspace(1)* %87, align 4, !tbaa !15
  %107 = fmul contract float %106, %10
  %108 = getelementptr inbounds float, float addrspace(1)* %3, i64 %97
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !15
  %110 = fmul contract float %109, %107
  store float %110, float addrspace(1)* %108, align 4, !tbaa !15
  %111 = add i32 %93, %31
  %112 = icmp slt i32 %111, %8
  br i1 %112, label %92, label %88, !llvm.loop !23
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
