; ModuleID = '../data/hip_kernels/2277/4/main.cu'
source_filename = "../data/hip_kernels/2277/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11NV12ToRGBAfPjmP15HIP_vector_typeIfLj4EEmjj(i32 addrspace(1)* nocapture readonly %0, i64 %1, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %2, i64 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = bitcast i32 addrspace(1)* %0 to i8 addrspace(1)*
  %8 = trunc i64 %1 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = shl nuw nsw i16 %13, 1
  %15 = zext i16 %14 to i32
  %16 = mul i32 %9, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = shl nuw nsw i32 %17, 1
  %19 = add i32 %16, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add i32 %25, %26
  %28 = icmp ult i32 %19, %4
  %29 = icmp ult i32 %27, %5
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %130

31:                                               ; preds = %6
  %32 = mul i32 %27, %8
  %33 = add i32 %32, %19
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !7, !amdgpu.noclobber !5
  %37 = zext i8 %36 to i32
  %38 = shl nuw nsw i32 %37, 2
  %39 = add i32 %33, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7, !amdgpu.noclobber !5
  %43 = zext i8 %42 to i32
  %44 = shl nuw nsw i32 %43, 2
  %45 = mul i32 %8, %5
  %46 = ashr i32 %27, 1
  %47 = and i32 %27, 1
  %48 = icmp eq i32 %47, 0
  %49 = mul i32 %46, %8
  %50 = add i32 %19, %45
  %51 = add i32 %50, %49
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %52
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !7
  %55 = zext i8 %54 to i32
  %56 = add i32 %51, 1
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !7
  %60 = zext i8 %59 to i32
  br i1 %48, label %84, label %61

61:                                               ; preds = %31
  %62 = lshr i32 %5, 1
  %63 = add nsw i32 %62, -1
  %64 = icmp ult i32 %46, %63
  br i1 %64, label %65, label %84

65:                                               ; preds = %61
  %66 = add nsw i32 %46, 1
  %67 = mul i32 %66, %8
  %68 = add i32 %50, %67
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %69
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !7, !amdgpu.noclobber !5
  %72 = zext i8 %71 to i32
  %73 = add nuw nsw i32 %55, 1
  %74 = add nuw nsw i32 %73, %72
  %75 = lshr i32 %74, 1
  %76 = add i32 %68, 1
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %77
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !7, !amdgpu.noclobber !5
  %80 = zext i8 %79 to i32
  %81 = add nuw nsw i32 %60, 1
  %82 = add nuw nsw i32 %81, %80
  %83 = lshr i32 %82, 1
  br label %84

84:                                               ; preds = %31, %61, %65
  %85 = phi i32 [ %83, %65 ], [ %60, %61 ], [ %60, %31 ]
  %86 = phi i32 [ %75, %65 ], [ %55, %61 ], [ %55, %31 ]
  %87 = shl nuw nsw i32 %86, 12
  %88 = shl nuw nsw i32 %85, 22
  %89 = or i32 %88, %87
  %90 = shl nuw nsw i32 %86, 2
  %91 = and i32 %90, 1020
  %92 = lshr i32 %89, 20
  %93 = uitofp i32 %38 to float
  %94 = uitofp i32 %91 to float
  %95 = fadd contract float %94, -5.120000e+02
  %96 = uitofp i32 %92 to float
  %97 = fadd contract float %96, -5.120000e+02
  %98 = fmul contract float %97, 0x3FF23D70A0000000
  %99 = fadd contract float %98, %93
  %100 = fmul contract float %95, 0x3FD947AE20000000
  %101 = fsub contract float %93, %100
  %102 = fmul contract float %97, 0x3FE2978D40000000
  %103 = fsub contract float %101, %102
  %104 = fmul contract float %95, 0x4000418940000000
  %105 = fadd contract float %104, %93
  %106 = uitofp i32 %44 to float
  %107 = fadd contract float %98, %106
  %108 = fsub contract float %106, %100
  %109 = fsub contract float %108, %102
  %110 = fadd contract float %104, %106
  %111 = fmul contract float %99, 0x3FCFE00000000000
  %112 = fmul contract float %103, 0x3FCFE00000000000
  %113 = fmul contract float %105, 0x3FCFE00000000000
  %114 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %111, i64 0
  %115 = insertelement <4 x float> %114, float %112, i64 1
  %116 = insertelement <4 x float> %115, float %113, i64 2
  %117 = mul i32 %27, %4
  %118 = add i32 %117, %19
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %119, i32 0, i32 0, i32 0
  store <4 x float> %116, <4 x float> addrspace(1)* %120, align 16
  %121 = fmul contract float %107, 0x3FCFE00000000000
  %122 = fmul contract float %109, 0x3FCFE00000000000
  %123 = fmul contract float %110, 0x3FCFE00000000000
  %124 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %121, i64 0
  %125 = insertelement <4 x float> %124, float %122, i64 1
  %126 = insertelement <4 x float> %125, float %123, i64 2
  %127 = add i32 %118, 1
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %128, i32 0, i32 0, i32 0
  store <4 x float> %126, <4 x float> addrspace(1)* %129, align 16
  br label %130

130:                                              ; preds = %6, %84
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
