; ModuleID = '../data/hip_kernels/153/3/main.cu'
source_filename = "../data/hip_kernels/153/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11CopyOutBackP15HIP_vector_typeIfLj4EEPfPiS3_S3_S3_iiii(%struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !4
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = add i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !15, !amdgpu.noclobber !14
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !15, !amdgpu.noclobber !14
  %34 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %35 = icmp slt i32 %34, %33
  br i1 %35, label %36, label %109

36:                                               ; preds = %10
  %37 = mul i32 %30, %6
  %38 = add i32 %37, %34
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !20, !amdgpu.noclobber !14
  %42 = mul i32 %38, %8
  %43 = shl i32 %7, 2
  %44 = mul i32 %43, %30
  %45 = sext i32 %42 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !15
  %48 = icmp slt i32 %8, 1
  %49 = icmp slt i32 %47, %44
  %50 = select i1 %48, i1 true, i1 %49
  br i1 %50, label %51, label %55

51:                                               ; preds = %74, %36
  %52 = icmp sgt i32 %9, 0
  br i1 %52, label %53, label %109

53:                                               ; preds = %51
  %54 = mul i32 %38, %9
  br label %83

55:                                               ; preds = %36, %74
  %56 = phi i32 [ %79, %74 ], [ %47, %36 ]
  %57 = phi i32 [ %75, %74 ], [ 0, %36 ]
  %58 = freeze i32 %56
  %59 = sdiv i32 %58, 4
  %60 = mul i32 %59, 4
  %61 = sub i32 %58, %60
  switch i32 %61, label %74 [
    i32 0, label %62
    i32 1, label %65
    i32 2, label %68
    i32 3, label %71
  ]

62:                                               ; preds = %55
  %63 = sext i32 %59 to i64
  %64 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %63, i32 0, i32 0, i32 0, i64 0
  store float %41, float addrspace(1)* %64, align 16, !tbaa !22
  br label %74

65:                                               ; preds = %55
  %66 = sext i32 %59 to i64
  %67 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %66, i32 0, i32 0, i32 0, i64 1
  store float %41, float addrspace(1)* %67, align 4, !tbaa !22
  br label %74

68:                                               ; preds = %55
  %69 = sext i32 %59 to i64
  %70 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %69, i32 0, i32 0, i32 0, i64 2
  store float %41, float addrspace(1)* %70, align 8, !tbaa !22
  br label %74

71:                                               ; preds = %55
  %72 = sext i32 %59 to i64
  %73 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %72, i32 0, i32 0, i32 0, i64 3
  store float %41, float addrspace(1)* %73, align 4, !tbaa !22
  br label %74

74:                                               ; preds = %55, %71, %68, %65, %62
  %75 = add nuw nsw i32 %57, 1
  %76 = add nsw i32 %75, %42
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !15
  %80 = icmp sge i32 %75, %8
  %81 = icmp slt i32 %79, %44
  %82 = select i1 %80, i1 true, i1 %81
  br i1 %82, label %51, label %55, !llvm.loop !23

83:                                               ; preds = %53, %106
  %84 = phi i32 [ 0, %53 ], [ %107, %106 ]
  %85 = add i32 %84, %54
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !15
  %89 = icmp sgt i32 %88, -1
  br i1 %89, label %90, label %109

90:                                               ; preds = %83
  %91 = lshr i32 %88, 2
  %92 = and i32 %88, 3
  switch i32 %92, label %105 [
    i32 0, label %93
    i32 1, label %96
    i32 2, label %99
    i32 3, label %102
  ]

93:                                               ; preds = %90
  %94 = zext i32 %91 to i64
  %95 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %94, i32 0, i32 0, i32 0, i64 0
  store float %41, float addrspace(1)* %95, align 16, !tbaa !22
  br label %106

96:                                               ; preds = %90
  %97 = zext i32 %91 to i64
  %98 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %97, i32 0, i32 0, i32 0, i64 1
  store float %41, float addrspace(1)* %98, align 4, !tbaa !22
  br label %106

99:                                               ; preds = %90
  %100 = zext i32 %91 to i64
  %101 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %100, i32 0, i32 0, i32 0, i64 2
  store float %41, float addrspace(1)* %101, align 8, !tbaa !22
  br label %106

102:                                              ; preds = %90
  %103 = zext i32 %91 to i64
  %104 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %103, i32 0, i32 0, i32 0, i64 3
  store float %41, float addrspace(1)* %104, align 4, !tbaa !22
  br label %106

105:                                              ; preds = %90
  unreachable

106:                                              ; preds = %102, %99, %96, %93
  %107 = add nuw nsw i32 %84, 1
  %108 = icmp eq i32 %107, %9
  br i1 %108, label %109, label %83, !llvm.loop !25

109:                                              ; preds = %106, %83, %51, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{i32 0, i32 1024}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !17, i64 0}
!22 = !{!17, !17, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = distinct !{!25, !24}
