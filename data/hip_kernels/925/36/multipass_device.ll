; ModuleID = '../data/hip_kernels/925/36/main.cu'
source_filename = "../data/hip_kernels/925/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x %struct.HIP_vector_type], align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9multipassP15HIP_vector_typeIdLj2EES1_i(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 16
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 8, !tbaa !16
  %24 = mul nuw nsw i32 %15, %20
  %25 = add nuw nsw i32 %24, %5
  %26 = mul nuw nsw i32 %25, %11
  %27 = add nuw nsw i32 %26, %4
  %28 = udiv i32 %14, %11
  %29 = mul i32 %28, %11
  %30 = icmp ugt i32 %14, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = udiv i32 %23, %20
  %34 = mul i32 %33, %20
  %35 = icmp ugt i32 %23, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %39 = mul i32 %37, %38
  %40 = add i32 %39, %16
  %41 = mul i32 %40, %32
  %42 = add i32 %41, %7
  %43 = getelementptr i8, i8 addrspace(4)* %6, i64 8
  %44 = bitcast i8 addrspace(4)* %43 to i16 addrspace(4)*
  %45 = load i16, i16 addrspace(4)* %44, align 4, !range !5, !invariant.load !6
  %46 = zext i16 %45 to i32
  %47 = mul i32 %42, %46
  %48 = add i32 %47, %15
  %49 = mul i32 %48, %20
  %50 = add i32 %49, %5
  %51 = mul i32 %50, %11
  %52 = add i32 %51, %4
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %53
  %55 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @sdata, i32 0, i32 %27
  %56 = bitcast %struct.HIP_vector_type addrspace(3)* %55 to i8 addrspace(3)*
  %57 = bitcast %struct.HIP_vector_type addrspace(1)* %54 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 16 dereferenceable(16) %56, i8 addrspace(1)* noundef align 16 dereferenceable(16) %57, i64 16, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = icmp ult i16 %10, 2
  br i1 %58, label %62, label %59

59:                                               ; preds = %3
  %60 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(3)* %55, i32 0, i32 0, i32 0, i32 0, i32 0
  %61 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @sdata, i32 0, i32 %27, i32 0, i32 0, i32 0, i32 1
  br label %64

62:                                               ; preds = %78, %3
  %63 = icmp eq i32 %27, 0
  br i1 %63, label %80, label %84

64:                                               ; preds = %59, %78
  %65 = phi i32 [ %11, %59 ], [ %66, %78 ]
  %66 = lshr i32 %65, 1
  %67 = icmp ult i32 %27, %66
  br i1 %67, label %68, label %78

68:                                               ; preds = %64
  %69 = add nuw i32 %66, %27
  %70 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @sdata, i32 0, i32 %69, i32 0, i32 0, i32 0, i32 0
  %71 = load double, double addrspace(3)* %70, align 16, !tbaa !17
  %72 = load double, double addrspace(3)* %60, align 16, !tbaa !17
  %73 = fadd contract double %71, %72
  store double %73, double addrspace(3)* %60, align 16, !tbaa !17
  %74 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @sdata, i32 0, i32 %69, i32 0, i32 0, i32 0, i32 1
  %75 = load double, double addrspace(3)* %74, align 8, !tbaa !17
  %76 = load double, double addrspace(3)* %61, align 8, !tbaa !17
  %77 = fadd contract double %75, %76
  store double %77, double addrspace(3)* %61, align 8, !tbaa !17
  br label %78

78:                                               ; preds = %68, %64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %79 = icmp ult i32 %65, 4
  br i1 %79, label %62, label %64, !llvm.loop !20

80:                                               ; preds = %62
  %81 = zext i32 %42 to i64
  %82 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %81
  %83 = bitcast %struct.HIP_vector_type addrspace(1)* %82 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p3i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %83, i8 addrspace(3)* noundef align 16 dereferenceable(16) bitcast ([0 x %struct.HIP_vector_type] addrspace(3)* @sdata to i8 addrspace(3)*), i64 16, i1 false)
  br label %84

84:                                               ; preds = %80, %62
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p3i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(3)* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!8, !12, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
