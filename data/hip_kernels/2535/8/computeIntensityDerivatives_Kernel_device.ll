; ModuleID = '../data/hip_kernels/2535/8/main.cu'
source_filename = "../data/hip_kernels/2535/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z34computeIntensityDerivatives_KernelP15HIP_vector_typeIfLj2EEPKfjj(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp ult i32 %13, %2
  %23 = icmp ult i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %114

25:                                               ; preds = %4
  %26 = mul i32 %21, %2
  %27 = add i32 %26, %13
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28
  %30 = bitcast %struct.HIP_vector_type addrspace(1)* %29 to i32 addrspace(1)*
  store i32 -8388608, i32 addrspace(1)* %30, align 8
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i64 1
  %32 = bitcast float addrspace(1)* %31 to i32 addrspace(1)*
  store i32 -8388608, i32 addrspace(1)* %32, align 4
  %33 = icmp eq i32 %13, 0
  br i1 %33, label %114, label %34

34:                                               ; preds = %25
  %35 = add i32 %2, -1
  %36 = icmp ult i32 %13, %35
  %37 = icmp ne i32 %21, 0
  %38 = select i1 %36, i1 %37, i1 false
  %39 = add i32 %3, -1
  %40 = icmp ult i32 %21, %39
  %41 = select i1 %38, i1 %40, i1 false
  br i1 %41, label %42, label %114

42:                                               ; preds = %34
  %43 = add i32 %21, -1
  %44 = mul i32 %43, %2
  %45 = add i32 %13, -1
  %46 = add i32 %44, %45
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = fcmp contract oeq float %49, 0xFFF0000000000000
  br i1 %50, label %114, label %51

51:                                               ; preds = %42
  %52 = add i32 %26, %45
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = fcmp contract oeq float %55, 0xFFF0000000000000
  br i1 %56, label %114, label %57

57:                                               ; preds = %51
  %58 = add nuw i32 %21, 1
  %59 = mul i32 %58, %2
  %60 = add i32 %59, %45
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = fcmp contract oeq float %63, 0xFFF0000000000000
  br i1 %64, label %114, label %65

65:                                               ; preds = %57
  %66 = add i32 %44, %13
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = fcmp contract oeq float %69, 0xFFF0000000000000
  br i1 %70, label %114, label %71

71:                                               ; preds = %65
  %72 = add i32 %59, %13
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = fcmp contract oeq float %75, 0xFFF0000000000000
  br i1 %76, label %114, label %77

77:                                               ; preds = %71
  %78 = add nuw i32 %13, 1
  %79 = add i32 %44, %78
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fcmp contract oeq float %82, 0xFFF0000000000000
  br i1 %83, label %114, label %84

84:                                               ; preds = %77
  %85 = add i32 %26, %78
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fcmp contract oeq float %88, 0xFFF0000000000000
  br i1 %89, label %114, label %90

90:                                               ; preds = %84
  %91 = add i32 %59, %78
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = fcmp contract oeq float %94, 0xFFF0000000000000
  br i1 %95, label %114, label %96

96:                                               ; preds = %90
  %97 = fsub contract float %82, %49
  %98 = fmul contract float %55, 2.000000e+00
  %99 = fsub contract float %97, %98
  %100 = fmul contract float %88, 2.000000e+00
  %101 = fadd contract float %99, %100
  %102 = fsub contract float %101, %63
  %103 = fadd contract float %102, %94
  %104 = fmul contract float %103, 1.250000e-01
  %105 = fmul contract float %69, -2.000000e+00
  %106 = fsub contract float %105, %49
  %107 = fsub contract float %106, %82
  %108 = fadd contract float %63, %107
  %109 = fmul contract float %75, 2.000000e+00
  %110 = fadd contract float %109, %108
  %111 = fadd contract float %110, %94
  %112 = fmul contract float %111, 1.250000e-01
  %113 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %29, i64 0, i32 0, i32 0, i32 0, i64 0
  store float %104, float addrspace(1)* %113, align 8
  store float %112, float addrspace(1)* %31, align 4
  br label %114

114:                                              ; preds = %42, %57, %71, %84, %90, %96, %77, %65, %51, %4, %34, %25
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
