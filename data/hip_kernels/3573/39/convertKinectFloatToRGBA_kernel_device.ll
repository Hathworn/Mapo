; ModuleID = '../data/hip_kernels/3573/39/main.cu'
source_filename = "../data/hip_kernels/3573/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z31convertKinectFloatToRGBA_kernelP15HIP_vector_typeIhLj4EEPKfiiiff(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = shl i32 %8, 8
  %15 = ashr exact i32 %14, 8
  %16 = mul nsw i32 %15, %13
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = shl i32 %19, 8
  %25 = ashr exact i32 %24, 8
  %26 = mul nsw i32 %25, %23
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %18, %2
  %30 = icmp slt i32 %28, %3
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %94

32:                                               ; preds = %7
  %33 = bitcast float addrspace(1)* %1 to i8 addrspace(1)*
  %34 = mul nsw i32 %28, %4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %33, i64 %35
  %37 = bitcast i8 addrspace(1)* %36 to float addrspace(1)*
  %38 = sext i32 %18 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %37, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = fcmp contract oeq float %40, 0.000000e+00
  %42 = select i1 %41, float 0x7FF8000000000000, float %40
  %43 = tail call i1 @llvm.amdgcn.class.f32(float %42, i32 504)
  br i1 %43, label %44, label %79

44:                                               ; preds = %32
  %45 = fsub contract float %42, %5
  %46 = fsub contract float %6, %5
  %47 = fdiv contract float %45, %46
  %48 = fcmp contract olt float %47, 2.500000e-01
  br i1 %48, label %49, label %51

49:                                               ; preds = %44
  %50 = fmul contract float %47, 4.000000e+00
  br label %72

51:                                               ; preds = %44
  %52 = fcmp contract olt float %47, 5.000000e-01
  br i1 %52, label %53, label %60

53:                                               ; preds = %51
  %54 = fsub contract float 2.500000e-01, %47
  %55 = fmul contract float %54, 4.000000e+00
  %56 = fadd contract float %55, 1.000000e+00
  %57 = fpext float %56 to double
  %58 = fmul contract double %57, 2.550000e+02
  %59 = fptoui double %58 to i8
  br label %72

60:                                               ; preds = %51
  %61 = fcmp contract olt float %47, 7.500000e-01
  br i1 %61, label %62, label %68

62:                                               ; preds = %60
  %63 = fadd contract float %47, -5.000000e-01
  %64 = fmul contract float %63, 4.000000e+00
  %65 = fpext float %64 to double
  %66 = fmul contract double %65, 2.550000e+02
  %67 = fptoui double %66 to i8
  br label %72

68:                                               ; preds = %60
  %69 = fsub contract float 7.500000e-01, %47
  %70 = fmul contract float %69, 4.000000e+00
  %71 = fadd contract float %70, 1.000000e+00
  br label %72

72:                                               ; preds = %53, %68, %62, %49
  %73 = phi i8 [ 0, %49 ], [ 0, %53 ], [ %67, %62 ], [ -1, %68 ]
  %74 = phi float [ %50, %49 ], [ 1.000000e+00, %53 ], [ 1.000000e+00, %62 ], [ %71, %68 ]
  %75 = phi i8 [ -1, %49 ], [ %59, %53 ], [ 0, %62 ], [ 0, %68 ]
  %76 = fpext float %74 to double
  %77 = fmul contract double %76, 2.550000e+02
  %78 = fptoui double %77 to i8
  br label %79

79:                                               ; preds = %32, %72
  %80 = phi i8 [ %75, %72 ], [ -1, %32 ]
  %81 = phi i8 [ %78, %72 ], [ -1, %32 ]
  %82 = phi i8 [ %73, %72 ], [ -1, %32 ]
  %83 = shl i32 %28, 8
  %84 = ashr exact i32 %83, 8
  %85 = shl i32 %2, 8
  %86 = ashr exact i32 %85, 8
  %87 = mul nsw i32 %84, %86
  %88 = add nsw i32 %87, %18
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %89, i32 0, i32 0, i32 0, i64 0
  store i8 %82, i8 addrspace(1)* %90, align 4
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %89, i32 0, i32 0, i32 0, i64 1
  store i8 %81, i8 addrspace(1)* %91, align 1
  %92 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %89, i32 0, i32 0, i32 0, i64 2
  store i8 %80, i8 addrspace(1)* %92, align 2
  %93 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %89, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %93, align 1
  br label %94

94:                                               ; preds = %79, %7
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
