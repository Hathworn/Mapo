; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/1542/5/copyp2p.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/1542/5/copyp2p.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i32> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7copyp2pP15HIP_vector_typeIiLj4EEPKS0_m(%struct.HIP_vector_type addrspace(1)* noalias nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = udiv i32 %12, %9
  %18 = mul i32 %17, %9
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %9
  %23 = zext i32 %22 to i64
  %24 = icmp ult i64 %16, %2
  br i1 %24, label %26, label %25

25:                                               ; preds = %26, %34, %41, %48, %55, %3
  ret void

26:                                               ; preds = %3, %55
  %27 = phi i64 [ %60, %55 ], [ %16, %3 ]
  %28 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %27
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %27
  %30 = bitcast %struct.HIP_vector_type addrspace(1)* %29 to i8 addrspace(1)*
  %31 = bitcast %struct.HIP_vector_type addrspace(1)* %28 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %30, i8 addrspace(1)* noundef align 16 dereferenceable(16) %31, i64 16, i1 false)
  %32 = add i64 %27, %23
  %33 = icmp ult i64 %32, %2
  br i1 %33, label %34, label %25, !llvm.loop !16

34:                                               ; preds = %26
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %32
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %32
  %37 = bitcast %struct.HIP_vector_type addrspace(1)* %36 to i8 addrspace(1)*
  %38 = bitcast %struct.HIP_vector_type addrspace(1)* %35 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %37, i8 addrspace(1)* noundef align 16 dereferenceable(16) %38, i64 16, i1 false)
  %39 = add i64 %32, %23
  %40 = icmp ult i64 %39, %2
  br i1 %40, label %41, label %25, !llvm.loop !16

41:                                               ; preds = %34
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %39
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %39
  %44 = bitcast %struct.HIP_vector_type addrspace(1)* %43 to i8 addrspace(1)*
  %45 = bitcast %struct.HIP_vector_type addrspace(1)* %42 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %44, i8 addrspace(1)* noundef align 16 dereferenceable(16) %45, i64 16, i1 false)
  %46 = add i64 %39, %23
  %47 = icmp ult i64 %46, %2
  br i1 %47, label %48, label %25, !llvm.loop !16

48:                                               ; preds = %41
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %46
  %50 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %46
  %51 = bitcast %struct.HIP_vector_type addrspace(1)* %50 to i8 addrspace(1)*
  %52 = bitcast %struct.HIP_vector_type addrspace(1)* %49 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %51, i8 addrspace(1)* noundef align 16 dereferenceable(16) %52, i64 16, i1 false)
  %53 = add i64 %46, %23
  %54 = icmp ult i64 %53, %2
  br i1 %54, label %55, label %25, !llvm.loop !16

55:                                               ; preds = %48
  %56 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %53
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %53
  %58 = bitcast %struct.HIP_vector_type addrspace(1)* %57 to i8 addrspace(1)*
  %59 = bitcast %struct.HIP_vector_type addrspace(1)* %56 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %58, i8 addrspace(1)* noundef align 16 dereferenceable(16) %59, i64 16, i1 false)
  %60 = add i64 %53, %23
  %61 = icmp ult i64 %60, %2
  br i1 %61, label %26, label %25, !llvm.loop !19
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = distinct !{!16, !17, !18}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!"llvm.loop.unroll.count", i32 5}
!19 = distinct !{!19, !17, !20}
!20 = !{!"llvm.loop.unroll.disable"}
