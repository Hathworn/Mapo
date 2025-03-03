; ModuleID = '../data/hip_kernels/16413/1/main.cu'
source_filename = "../data/hip_kernels/16413/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20KNearestNeighborsGPUP15HIP_vector_typeIfLj3EEPii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %103

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %15, i32 0, i32 0, i32 0, i32 0, i64 0
  %17 = load float, float addrspace(1)* %16, align 4, !amdgpu.noclobber !5
  %18 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %15, i32 0, i32 0, i32 0, i32 0, i64 1
  %19 = load float, float addrspace(1)* %18, align 4, !amdgpu.noclobber !5
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %15, i32 0, i32 0, i32 0, i32 0, i64 2
  %21 = load float, float addrspace(1)* %20, align 4, !amdgpu.noclobber !5
  %22 = icmp sgt i32 %2, 0
  br i1 %22, label %23, label %103

23:                                               ; preds = %14
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  %25 = and i32 %2, 1
  %26 = icmp eq i32 %2, 1
  br i1 %26, label %79, label %27

27:                                               ; preds = %23
  %28 = and i32 %2, -2
  br label %29

29:                                               ; preds = %74, %27
  %30 = phi i32 [ 0, %27 ], [ %76, %74 ]
  %31 = phi float [ 0x47EFFFFFE0000000, %27 ], [ %75, %74 ]
  %32 = phi i32 [ 0, %27 ], [ %77, %74 ]
  %33 = icmp eq i32 %12, %30
  br i1 %33, label %52, label %34

34:                                               ; preds = %29
  %35 = zext i32 %30 to i64
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %35, i32 0, i32 0, i32 0, i32 0, i64 0
  %37 = load float, float addrspace(1)* %36, align 4
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %35, i32 0, i32 0, i32 0, i32 0, i64 1
  %39 = load float, float addrspace(1)* %38, align 4
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %35, i32 0, i32 0, i32 0, i32 0, i64 2
  %41 = load float, float addrspace(1)* %40, align 4
  %42 = fsub contract float %17, %37
  %43 = fmul contract float %42, %42
  %44 = fsub contract float %19, %39
  %45 = fmul contract float %44, %44
  %46 = fadd contract float %43, %45
  %47 = fsub contract float %21, %41
  %48 = fmul contract float %47, %47
  %49 = fadd contract float %46, %48
  %50 = fcmp contract olt float %49, %31
  br i1 %50, label %51, label %52

51:                                               ; preds = %34
  store i32 %30, i32 addrspace(1)* %24, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %34, %51, %29
  %53 = phi float [ %31, %29 ], [ %49, %51 ], [ %31, %34 ]
  %54 = or i32 %30, 1
  %55 = icmp eq i32 %12, %54
  br i1 %55, label %74, label %56

56:                                               ; preds = %52
  %57 = zext i32 %54 to i64
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %57, i32 0, i32 0, i32 0, i32 0, i64 0
  %59 = load float, float addrspace(1)* %58, align 4
  %60 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %57, i32 0, i32 0, i32 0, i32 0, i64 1
  %61 = load float, float addrspace(1)* %60, align 4
  %62 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %57, i32 0, i32 0, i32 0, i32 0, i64 2
  %63 = load float, float addrspace(1)* %62, align 4
  %64 = fsub contract float %17, %59
  %65 = fmul contract float %64, %64
  %66 = fsub contract float %19, %61
  %67 = fmul contract float %66, %66
  %68 = fadd contract float %65, %67
  %69 = fsub contract float %21, %63
  %70 = fmul contract float %69, %69
  %71 = fadd contract float %68, %70
  %72 = fcmp contract olt float %71, %53
  br i1 %72, label %73, label %74

73:                                               ; preds = %56
  store i32 %54, i32 addrspace(1)* %24, align 4, !tbaa !7
  br label %74

74:                                               ; preds = %73, %56, %52
  %75 = phi float [ %53, %52 ], [ %71, %73 ], [ %53, %56 ]
  %76 = add nuw nsw i32 %30, 2
  %77 = add i32 %32, 2
  %78 = icmp eq i32 %77, %28
  br i1 %78, label %79, label %29, !llvm.loop !11

79:                                               ; preds = %74, %23
  %80 = phi i32 [ 0, %23 ], [ %76, %74 ]
  %81 = phi float [ 0x47EFFFFFE0000000, %23 ], [ %75, %74 ]
  %82 = icmp eq i32 %25, 0
  %83 = icmp eq i32 %12, %80
  %84 = select i1 %82, i1 true, i1 %83
  br i1 %84, label %103, label %85

85:                                               ; preds = %79
  %86 = zext i32 %80 to i64
  %87 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %86, i32 0, i32 0, i32 0, i32 0, i64 0
  %88 = load float, float addrspace(1)* %87, align 4
  %89 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %86, i32 0, i32 0, i32 0, i32 0, i64 1
  %90 = load float, float addrspace(1)* %89, align 4
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %86, i32 0, i32 0, i32 0, i32 0, i64 2
  %92 = load float, float addrspace(1)* %91, align 4
  %93 = fsub contract float %17, %88
  %94 = fmul contract float %93, %93
  %95 = fsub contract float %19, %90
  %96 = fmul contract float %95, %95
  %97 = fadd contract float %94, %96
  %98 = fsub contract float %21, %92
  %99 = fmul contract float %98, %98
  %100 = fadd contract float %97, %99
  %101 = fcmp contract olt float %100, %81
  br i1 %101, label %102, label %103

102:                                              ; preds = %85
  store i32 %80, i32 addrspace(1)* %24, align 4, !tbaa !7
  br label %103

103:                                              ; preds = %79, %102, %85, %14, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
