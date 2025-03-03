; ModuleID = '../data/hip_kernels/18288/8/main.cu'
source_filename = "../data/hip_kernels/18288/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24mean_interpolate_forwardiiiiiPKiS0_PKfPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = icmp slt i32 %10, %0
  br i1 %11, label %12, label %28

12:                                               ; preds = %9
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = mul nsw i32 %3, %1
  %15 = icmp slt i32 %13, %14
  %16 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !5
  %22 = load i16, i16 addrspace(4)* %18, align 4, !range !14, !invariant.load !15
  %23 = zext i16 %22 to i32
  %24 = udiv i32 %21, %23
  %25 = mul i32 %24, %23
  %26 = icmp ugt i32 %21, %25
  %27 = zext i1 %26 to i32
  br label %29

28:                                               ; preds = %35, %9
  ret void

29:                                               ; preds = %12, %35
  %30 = phi i32 [ %10, %12 ], [ %37, %35 ]
  br i1 %15, label %31, label %35

31:                                               ; preds = %29
  %32 = mul nsw i32 %30, %1
  %33 = mul nsw i32 %30, %2
  %34 = mul nsw i32 %32, %3
  br label %39

35:                                               ; preds = %79, %29
  %36 = add i32 %24, %30
  %37 = add i32 %36, %27
  %38 = icmp slt i32 %37, %0
  br i1 %38, label %29, label %28, !llvm.loop !16

39:                                               ; preds = %31, %79
  %40 = phi i32 [ %13, %31 ], [ %80, %79 ]
  %41 = freeze i32 %40
  %42 = freeze i32 %3
  %43 = sdiv i32 %41, %42
  %44 = mul i32 %43, %42
  %45 = sub i32 %41, %44
  %46 = add nsw i32 %43, %32
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !18, !amdgpu.noclobber !15
  %50 = icmp sgt i32 %49, 0
  br i1 %50, label %51, label %79

51:                                               ; preds = %39
  %52 = mul i32 %46, %4
  %53 = sitofp i32 %49 to float
  %54 = add nsw i32 %40, %34
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %8, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !22
  %58 = and i32 %49, 1
  %59 = icmp eq i32 %49, 1
  br i1 %59, label %62, label %60

60:                                               ; preds = %51
  %61 = and i32 %49, -2
  br label %82

62:                                               ; preds = %82, %51
  %63 = phi float [ %57, %51 ], [ %110, %82 ]
  %64 = phi i32 [ 0, %51 ], [ %111, %82 ]
  %65 = icmp eq i32 %58, 0
  br i1 %65, label %79, label %66

66:                                               ; preds = %62
  %67 = add nsw i32 %64, %52
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !18, !amdgpu.noclobber !15
  %71 = add i32 %70, %33
  %72 = mul i32 %71, %3
  %73 = add nsw i32 %72, %45
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %7, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !22
  %77 = fdiv contract float %76, %53
  %78 = fadd contract float %63, %77
  store float %78, float addrspace(1)* %56, align 4, !tbaa !22
  br label %79

79:                                               ; preds = %66, %62, %39
  %80 = add i32 %40, %23
  %81 = icmp slt i32 %80, %14
  br i1 %81, label %39, label %35, !llvm.loop !24

82:                                               ; preds = %82, %60
  %83 = phi float [ %57, %60 ], [ %110, %82 ]
  %84 = phi i32 [ 0, %60 ], [ %111, %82 ]
  %85 = phi i32 [ 0, %60 ], [ %112, %82 ]
  %86 = add nsw i32 %84, %52
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !18, !amdgpu.noclobber !15
  %90 = add i32 %89, %33
  %91 = mul i32 %90, %3
  %92 = add nsw i32 %91, %45
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %7, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !22
  %96 = fdiv contract float %95, %53
  %97 = fadd contract float %83, %96
  store float %97, float addrspace(1)* %56, align 4, !tbaa !22
  %98 = or i32 %84, 1
  %99 = add nsw i32 %98, %52
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !18, !amdgpu.noclobber !15
  %103 = add i32 %102, %33
  %104 = mul i32 %103, %3
  %105 = add nsw i32 %104, %45
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %7, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !22
  %109 = fdiv contract float %108, %53
  %110 = fadd contract float %97, %109
  store float %110, float addrspace(1)* %56, align 4, !tbaa !22
  %111 = add nuw nsw i32 %84, 2
  %112 = add i32 %85, 2
  %113 = icmp eq i32 %112, %61
  br i1 %113, label %62, label %82, !llvm.loop !25
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !20, i64 0}
!24 = distinct !{!24, !17}
!25 = distinct !{!25, !17}
