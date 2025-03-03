; ModuleID = '../data/hip_kernels/11580/55/main.cu'
source_filename = "../data/hip_kernels/11580/55/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23cuConvertLABToRGBKernelPK15HIP_vector_typeIfLj4EEPS0_mii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i64 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %3
  %24 = icmp slt i32 %22, %4
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %94

26:                                               ; preds = %5
  %27 = trunc i64 %2 to i32
  %28 = mul i32 %22, %27
  %29 = add i32 %28, %14
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i64 0
  %32 = load float, float addrspace(1)* %31, align 16, !amdgpu.noclobber !5
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i64 1
  %34 = load float, float addrspace(1)* %33, align 4, !amdgpu.noclobber !5
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i64 2
  %36 = load float, float addrspace(1)* %35, align 8, !amdgpu.noclobber !5
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i64 3
  %38 = load float, float addrspace(1)* %37, align 4, !amdgpu.noclobber !5
  %39 = fadd contract float %32, 1.600000e+01
  %40 = fdiv contract float %39, 1.160000e+02
  %41 = fcmp contract ogt float %32, 8.000000e+00
  br i1 %41, label %42, label %45

42:                                               ; preds = %26
  %43 = fmul contract float %40, %40
  %44 = fmul contract float %40, %43
  br label %47

45:                                               ; preds = %26
  %46 = fdiv contract float %32, 0x408C3A5EE0000000
  br label %47

47:                                               ; preds = %45, %42
  %48 = phi float [ %44, %42 ], [ %46, %45 ]
  %49 = fdiv contract float %34, 5.000000e+02
  %50 = fadd contract float %49, %40
  %51 = fcmp contract ogt float %50, 0x3FCA7B9620000000
  br i1 %51, label %52, label %55

52:                                               ; preds = %47
  %53 = fmul contract float %50, %50
  %54 = fmul contract float %50, %53
  br label %59

55:                                               ; preds = %47
  %56 = fmul contract float %50, 1.160000e+02
  %57 = fadd contract float %56, -1.600000e+01
  %58 = fdiv contract float %57, 0x408C3A5EE0000000
  br label %59

59:                                               ; preds = %55, %52
  %60 = phi float [ %54, %52 ], [ %58, %55 ]
  %61 = fdiv contract float %36, 2.000000e+02
  %62 = fsub contract float %40, %61
  %63 = fcmp contract ogt float %62, 0x3FCA7B9620000000
  br i1 %63, label %64, label %67

64:                                               ; preds = %59
  %65 = fmul contract float %62, %62
  %66 = fmul contract float %62, %65
  br label %71

67:                                               ; preds = %59
  %68 = fmul contract float %62, 1.160000e+02
  %69 = fadd contract float %68, -1.600000e+01
  %70 = fdiv contract float %69, 0x408C3A5EE0000000
  br label %71

71:                                               ; preds = %67, %64
  %72 = phi float [ %66, %64 ], [ %70, %67 ]
  %73 = fmul contract float %60, 0x3FEE6A22C0000000
  %74 = fmul contract float %72, 0x3FF16B8960000000
  %75 = fmul contract float %73, 0x4009EC7340000000
  %76 = fmul contract float %48, 0x3FF8981E80000000
  %77 = fsub contract float %75, %76
  %78 = fmul contract float %74, 0x3FDFE7F040000000
  %79 = fsub contract float %77, %78
  %80 = fmul contract float %73, 0x3FEF043A20000000
  %81 = fmul contract float %48, 0x3FFE0423E0000000
  %82 = fsub contract float %81, %80
  %83 = fmul contract float %74, 0x3FA546D400000000
  %84 = fadd contract float %82, %83
  %85 = fmul contract float %73, 0x3FAC7D4AA0000000
  %86 = fmul contract float %48, 0x3FCA1D8540000000
  %87 = fsub contract float %85, %86
  %88 = fmul contract float %74, 0x3FF0EA6500000000
  %89 = fadd contract float %87, %88
  %90 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %30, i32 0, i32 0, i32 0, i64 0
  store float %79, float addrspace(1)* %90, align 16
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %30, i32 0, i32 0, i32 0, i64 1
  store float %84, float addrspace(1)* %91, align 4
  %92 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %30, i32 0, i32 0, i32 0, i64 2
  store float %89, float addrspace(1)* %92, align 8
  %93 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %30, i32 0, i32 0, i32 0, i64 3
  store float %38, float addrspace(1)* %93, align 4
  br label %94

94:                                               ; preds = %71, %5
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
