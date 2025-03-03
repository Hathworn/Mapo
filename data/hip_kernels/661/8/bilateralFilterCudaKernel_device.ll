; ModuleID = '../data/hip_kernels/661/8/main.cu'
source_filename = "../data/hip_kernels/661/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

@c_gaussian = protected addrspace(4) externally_initialized global [64 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([64 x float] addrspace(4)* @c_gaussian to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25bilateralFilterCudaKernelP15HIP_vector_typeIfLj3EES1_fiii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, float %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %3
  %25 = icmp slt i32 %23, %4
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %133

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %3
  %29 = add nsw i32 %28, %15
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 0
  %32 = load float, float addrspace(1)* %31, align 4, !amdgpu.noclobber !5
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 1
  %34 = load float, float addrspace(1)* %33, align 4, !amdgpu.noclobber !5
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 2
  %36 = load float, float addrspace(1)* %35, align 4, !amdgpu.noclobber !5
  %37 = sub i32 0, %5
  %38 = icmp slt i32 %5, 0
  br i1 %38, label %44, label %39

39:                                               ; preds = %27
  %40 = add nsw i32 %4, -1
  %41 = add nsw i32 %3, -1
  %42 = fmul contract float %2, 2.000000e+00
  %43 = fmul contract float %42, %2
  br label %56

44:                                               ; preds = %72, %27
  %45 = phi float [ 0.000000e+00, %27 ], [ %130, %72 ]
  %46 = phi float [ 0.000000e+00, %27 ], [ %129, %72 ]
  %47 = phi float [ 0.000000e+00, %27 ], [ %128, %72 ]
  %48 = phi float [ 0.000000e+00, %27 ], [ %124, %72 ]
  %49 = fdiv contract float 1.000000e+00, %48
  %50 = fmul contract float %47, %49
  %51 = fmul contract float %46, %49
  %52 = fmul contract float %45, %49
  %53 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %50, float addrspace(1)* %53, align 4
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %51, float addrspace(1)* %54, align 4
  %55 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %52, float addrspace(1)* %55, align 4
  br label %133

56:                                               ; preds = %39, %72
  %57 = phi float [ 0.000000e+00, %39 ], [ %124, %72 ]
  %58 = phi float [ 0.000000e+00, %39 ], [ %128, %72 ]
  %59 = phi float [ 0.000000e+00, %39 ], [ %129, %72 ]
  %60 = phi float [ 0.000000e+00, %39 ], [ %130, %72 ]
  %61 = phi i32 [ %37, %39 ], [ %73, %72 ]
  %62 = add nsw i32 %61, %23
  %63 = icmp slt i32 %62, 0
  %64 = icmp slt i32 %62, %4
  %65 = select i1 %64, i32 %62, i32 %40
  %66 = select i1 %63, i32 0, i32 %65
  %67 = mul nsw i32 %66, %3
  %68 = add nsw i32 %61, %5
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [64 x float], [64 x float] addrspace(4)* @c_gaussian, i64 0, i64 %69
  %71 = load float, float addrspace(4)* %70, align 4, !tbaa !7
  br label %75

72:                                               ; preds = %75
  %73 = add i32 %61, 1
  %74 = icmp eq i32 %61, %5
  br i1 %74, label %44, label %56, !llvm.loop !11

75:                                               ; preds = %56, %75
  %76 = phi float [ %57, %56 ], [ %124, %75 ]
  %77 = phi float [ %58, %56 ], [ %128, %75 ]
  %78 = phi float [ %59, %56 ], [ %129, %75 ]
  %79 = phi float [ %60, %56 ], [ %130, %75 ]
  %80 = phi i32 [ %37, %56 ], [ %131, %75 ]
  %81 = add nsw i32 %80, %15
  %82 = icmp slt i32 %81, 0
  %83 = icmp slt i32 %81, %3
  %84 = select i1 %83, i32 %81, i32 %41
  %85 = select i1 %82, i32 0, i32 %84
  %86 = add nsw i32 %85, %67
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %87, i32 0, i32 0, i32 0, i32 0, i64 0
  %89 = load float, float addrspace(1)* %88, align 4, !amdgpu.noclobber !5
  %90 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %87, i32 0, i32 0, i32 0, i32 0, i64 1
  %91 = load float, float addrspace(1)* %90, align 4, !amdgpu.noclobber !5
  %92 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %87, i32 0, i32 0, i32 0, i32 0, i64 2
  %93 = load float, float addrspace(1)* %92, align 4, !amdgpu.noclobber !5
  %94 = add nsw i32 %80, %5
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [64 x float], [64 x float] addrspace(4)* @c_gaussian, i64 0, i64 %95
  %97 = load float, float addrspace(4)* %96, align 4, !tbaa !7
  %98 = fmul contract float %71, %97
  %99 = fsub contract float %32, %89
  %100 = fmul contract float %99, %99
  %101 = fsub contract float %34, %91
  %102 = fmul contract float %101, %101
  %103 = fadd contract float %100, %102
  %104 = fsub contract float %36, %93
  %105 = fmul contract float %104, %104
  %106 = fadd contract float %105, %103
  %107 = fneg contract float %106
  %108 = fdiv contract float %107, %43
  %109 = fmul float %108, 0x3FF7154760000000
  %110 = tail call float @llvm.rint.f32(float %109)
  %111 = fcmp ogt float %108, 0x40562E4300000000
  %112 = fcmp olt float %108, 0xC059D1DA00000000
  %113 = fneg float %109
  %114 = tail call float @llvm.fma.f32(float %108, float 0x3FF7154760000000, float %113)
  %115 = tail call float @llvm.fma.f32(float %108, float 0x3E54AE0BE0000000, float %114)
  %116 = fsub float %109, %110
  %117 = fadd float %115, %116
  %118 = tail call float @llvm.exp2.f32(float %117)
  %119 = fptosi float %110 to i32
  %120 = tail call float @llvm.amdgcn.ldexp.f32(float %118, i32 %119)
  %121 = select i1 %112, float 0.000000e+00, float %120
  %122 = select i1 %111, float 0x7FF0000000000000, float %121
  %123 = fmul contract float %98, %122
  %124 = fadd contract float %76, %123
  %125 = fmul contract float %89, %123
  %126 = fmul contract float %91, %123
  %127 = fmul contract float %93, %123
  %128 = fadd contract float %77, %125
  %129 = fadd contract float %78, %126
  %130 = fadd contract float %79, %127
  %131 = add i32 %80, 1
  %132 = icmp eq i32 %80, %5
  br i1 %132, label %72, label %75, !llvm.loop !13

133:                                              ; preds = %44, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
