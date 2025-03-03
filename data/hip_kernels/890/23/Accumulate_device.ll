; ModuleID = '../data/hip_kernels/890/23/main.cu'
source_filename = "../data/hip_kernels/890/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10AccumulateP15HIP_vector_typeIfLj4EES1_i(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %8
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = udiv i32 %11, %8
  %18 = mul i32 %17, %8
  %19 = icmp ugt i32 %11, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16
  %26 = bitcast %struct.HIP_vector_type addrspace(1)* %25 to i8 addrspace(1)*
  %27 = bitcast %struct.HIP_vector_type addrspace(1)* %24 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %26, i8 addrspace(1)* noundef align 16 dereferenceable(16) %27, i64 16, i1 false)
  %28 = icmp sgt i32 %2, 1
  br i1 %28, label %29, label %67

29:                                               ; preds = %3
  %30 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %25, i64 0, i32 0, i32 0, i32 0, i64 0
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 1
  %32 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 2
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 3
  %34 = load float, float addrspace(1)* %30, align 16, !tbaa !16
  %35 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %36 = load float, float addrspace(1)* %32, align 8, !tbaa !16
  %37 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %38 = add i32 %2, -1
  %39 = and i32 %38, 1
  %40 = icmp eq i32 %2, 2
  br i1 %40, label %45, label %41

41:                                               ; preds = %29
  %42 = and i32 %38, -2
  br label %68

43:                                               ; preds = %68
  %44 = zext i32 %106 to i64
  br label %45

45:                                               ; preds = %43, %29
  %46 = phi float [ %37, %29 ], [ %105, %43 ]
  %47 = phi float [ %36, %29 ], [ %102, %43 ]
  %48 = phi float [ %35, %29 ], [ %99, %43 ]
  %49 = phi float [ %34, %29 ], [ %96, %43 ]
  %50 = phi i64 [ 1, %29 ], [ %44, %43 ]
  %51 = icmp eq i32 %39, 0
  br i1 %51, label %67, label %52

52:                                               ; preds = %45
  %53 = mul nuw nsw i64 %50, %23
  %54 = add nuw i64 %53, %16
  %55 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %54, i32 0, i32 0, i32 0, i64 0
  %56 = load float, float addrspace(1)* %55, align 16, !tbaa !16
  %57 = fadd contract float %56, %49
  store float %57, float addrspace(1)* %30, align 16, !tbaa !16
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %54, i32 0, i32 0, i32 0, i64 1
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %60 = fadd contract float %59, %48
  store float %60, float addrspace(1)* %31, align 4, !tbaa !16
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %54, i32 0, i32 0, i32 0, i64 2
  %62 = load float, float addrspace(1)* %61, align 8, !tbaa !16
  %63 = fadd contract float %62, %47
  store float %63, float addrspace(1)* %32, align 8, !tbaa !16
  %64 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %54, i32 0, i32 0, i32 0, i64 3
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %66 = fadd contract float %65, %46
  store float %66, float addrspace(1)* %33, align 4, !tbaa !16
  br label %67

67:                                               ; preds = %52, %45, %3
  ret void

68:                                               ; preds = %68, %41
  %69 = phi float [ %37, %41 ], [ %105, %68 ]
  %70 = phi float [ %36, %41 ], [ %102, %68 ]
  %71 = phi float [ %35, %41 ], [ %99, %68 ]
  %72 = phi float [ %34, %41 ], [ %96, %68 ]
  %73 = phi i32 [ 1, %41 ], [ %106, %68 ]
  %74 = phi i32 [ 0, %41 ], [ %107, %68 ]
  %75 = zext i32 %73 to i64
  %76 = mul nuw nsw i64 %75, %23
  %77 = add nuw i64 %76, %16
  %78 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %77, i32 0, i32 0, i32 0, i64 0
  %79 = load float, float addrspace(1)* %78, align 16, !tbaa !16
  %80 = fadd contract float %79, %72
  store float %80, float addrspace(1)* %30, align 16, !tbaa !16
  %81 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %77, i32 0, i32 0, i32 0, i64 1
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = fadd contract float %82, %71
  store float %83, float addrspace(1)* %31, align 4, !tbaa !16
  %84 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %77, i32 0, i32 0, i32 0, i64 2
  %85 = load float, float addrspace(1)* %84, align 8, !tbaa !16
  %86 = fadd contract float %85, %70
  store float %86, float addrspace(1)* %32, align 8, !tbaa !16
  %87 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %77, i32 0, i32 0, i32 0, i64 3
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = fadd contract float %88, %69
  store float %89, float addrspace(1)* %33, align 4, !tbaa !16
  %90 = add nuw nsw i32 %73, 1
  %91 = zext i32 %90 to i64
  %92 = mul nuw nsw i64 %91, %23
  %93 = add nuw i64 %92, %16
  %94 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %93, i32 0, i32 0, i32 0, i64 0
  %95 = load float, float addrspace(1)* %94, align 16, !tbaa !16
  %96 = fadd contract float %95, %80
  store float %96, float addrspace(1)* %30, align 16, !tbaa !16
  %97 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %93, i32 0, i32 0, i32 0, i64 1
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %99 = fadd contract float %98, %83
  store float %99, float addrspace(1)* %31, align 4, !tbaa !16
  %100 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %93, i32 0, i32 0, i32 0, i64 2
  %101 = load float, float addrspace(1)* %100, align 8, !tbaa !16
  %102 = fadd contract float %101, %86
  store float %102, float addrspace(1)* %32, align 8, !tbaa !16
  %103 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %93, i32 0, i32 0, i32 0, i64 3
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = fadd contract float %104, %89
  store float %105, float addrspace(1)* %33, align 4, !tbaa !16
  %106 = add nuw nsw i32 %73, 2
  %107 = add nuw i32 %74, 2
  %108 = icmp eq i32 %107, %42
  br i1 %108, label %43, label %68, !llvm.loop !19
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
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
