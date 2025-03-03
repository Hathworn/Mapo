; ModuleID = '../data/hip_kernels/1838/37/main.cu'
source_filename = "../data/hip_kernels/1838/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25convertFloatToRGBA_kernelP15HIP_vector_typeIhLj4EEPKfiiff(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = shl i32 %7, 8
  %14 = ashr exact i32 %13, 8
  %15 = mul nsw i32 %14, %12
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = shl i32 %18, 8
  %24 = ashr exact i32 %23, 8
  %25 = mul nsw i32 %24, %22
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add i32 %25, %26
  %28 = icmp slt i32 %17, %2
  %29 = icmp slt i32 %27, %3
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %85

31:                                               ; preds = %6
  %32 = shl i32 %27, 8
  %33 = ashr exact i32 %32, 8
  %34 = shl i32 %2, 8
  %35 = ashr exact i32 %34, 8
  %36 = mul nsw i32 %33, %35
  %37 = add nsw i32 %36, %17
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = tail call i1 @llvm.amdgcn.class.f32(float %40, i32 504)
  br i1 %41, label %42, label %77

42:                                               ; preds = %31
  %43 = fsub contract float %40, %4
  %44 = fsub contract float %5, %4
  %45 = fdiv contract float %43, %44
  %46 = fcmp contract olt float %45, 2.500000e-01
  br i1 %46, label %47, label %49

47:                                               ; preds = %42
  %48 = fmul contract float %45, 4.000000e+00
  br label %70

49:                                               ; preds = %42
  %50 = fcmp contract olt float %45, 5.000000e-01
  br i1 %50, label %51, label %58

51:                                               ; preds = %49
  %52 = fsub contract float 2.500000e-01, %45
  %53 = fmul contract float %52, 4.000000e+00
  %54 = fadd contract float %53, 1.000000e+00
  %55 = fpext float %54 to double
  %56 = fmul contract double %55, 2.550000e+02
  %57 = fptoui double %56 to i8
  br label %70

58:                                               ; preds = %49
  %59 = fcmp contract olt float %45, 7.500000e-01
  br i1 %59, label %60, label %66

60:                                               ; preds = %58
  %61 = fadd contract float %45, -5.000000e-01
  %62 = fmul contract float %61, 4.000000e+00
  %63 = fpext float %62 to double
  %64 = fmul contract double %63, 2.550000e+02
  %65 = fptoui double %64 to i8
  br label %70

66:                                               ; preds = %58
  %67 = fsub contract float 7.500000e-01, %45
  %68 = fmul contract float %67, 4.000000e+00
  %69 = fadd contract float %68, 1.000000e+00
  br label %70

70:                                               ; preds = %51, %66, %60, %47
  %71 = phi i8 [ 0, %47 ], [ 0, %51 ], [ %65, %60 ], [ -1, %66 ]
  %72 = phi float [ %48, %47 ], [ 1.000000e+00, %51 ], [ 1.000000e+00, %60 ], [ %69, %66 ]
  %73 = phi i8 [ -1, %47 ], [ %57, %51 ], [ 0, %60 ], [ 0, %66 ]
  %74 = fpext float %72 to double
  %75 = fmul contract double %74, 2.550000e+02
  %76 = fptoui double %75 to i8
  br label %77

77:                                               ; preds = %31, %70
  %78 = phi i8 [ %73, %70 ], [ -1, %31 ]
  %79 = phi i8 [ %76, %70 ], [ -1, %31 ]
  %80 = phi i8 [ %71, %70 ], [ -1, %31 ]
  %81 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %38, i32 0, i32 0, i32 0, i64 0
  store i8 %80, i8 addrspace(1)* %81, align 4
  %82 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %38, i32 0, i32 0, i32 0, i64 1
  store i8 %79, i8 addrspace(1)* %82, align 1
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %38, i32 0, i32 0, i32 0, i64 2
  store i8 %78, i8 addrspace(1)* %83, align 2
  %84 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %38, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %84, align 1
  br label %85

85:                                               ; preds = %77, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

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
