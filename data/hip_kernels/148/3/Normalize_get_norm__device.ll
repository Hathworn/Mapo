; ModuleID = '../data/hip_kernels/148/3/main.cu'
source_filename = "../data/hip_kernels/148/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19Normalize_get_norm_PfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %4
  br i1 %15, label %16, label %138

16:                                               ; preds = %5
  %17 = freeze i32 %14
  %18 = freeze i32 %3
  %19 = sdiv i32 %17, %18
  %20 = mul i32 %19, %18
  %21 = sub i32 %17, %20
  %22 = icmp sgt i32 %2, 0
  br i1 %22, label %23, label %54

23:                                               ; preds = %16
  %24 = mul nsw i32 %19, %2
  %25 = and i32 %2, 7
  %26 = icmp ult i32 %2, 8
  br i1 %26, label %29, label %27

27:                                               ; preds = %23
  %28 = and i32 %2, -8
  br label %60

29:                                               ; preds = %60, %23
  %30 = phi float [ undef, %23 ], [ %134, %60 ]
  %31 = phi float [ 0.000000e+00, %23 ], [ %134, %60 ]
  %32 = phi i32 [ 0, %23 ], [ %135, %60 ]
  %33 = icmp eq i32 %25, 0
  br i1 %33, label %49, label %34

34:                                               ; preds = %29, %34
  %35 = phi float [ %45, %34 ], [ %31, %29 ]
  %36 = phi i32 [ %46, %34 ], [ %32, %29 ]
  %37 = phi i32 [ %47, %34 ], [ 0, %29 ]
  %38 = add nsw i32 %36, %24
  %39 = mul nsw i32 %38, %3
  %40 = add nsw i32 %39, %21
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fmul contract float %43, %43
  %45 = fadd contract float %35, %44
  %46 = add nuw nsw i32 %36, 1
  %47 = add i32 %37, 1
  %48 = icmp eq i32 %47, %25
  br i1 %48, label %49, label %34, !llvm.loop !11

49:                                               ; preds = %34, %29
  %50 = phi float [ %30, %29 ], [ %45, %34 ]
  %51 = fpext float %50 to double
  %52 = fadd contract double %51, 1.300000e-37
  %53 = fptrunc double %52 to float
  br label %54

54:                                               ; preds = %49, %16
  %55 = phi float [ 0x38461E4C80000000, %16 ], [ %53, %49 ]
  %56 = mul nsw i32 %19, %3
  %57 = add nsw i32 %56, %21
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  store float %55, float addrspace(1)* %59, align 4, !tbaa !7
  br label %138

60:                                               ; preds = %60, %27
  %61 = phi float [ 0.000000e+00, %27 ], [ %134, %60 ]
  %62 = phi i32 [ 0, %27 ], [ %135, %60 ]
  %63 = phi i32 [ 0, %27 ], [ %136, %60 ]
  %64 = add nsw i32 %62, %24
  %65 = mul nsw i32 %64, %3
  %66 = add nsw i32 %65, %21
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = fmul contract float %69, %69
  %71 = fadd contract float %61, %70
  %72 = or i32 %62, 1
  %73 = add nsw i32 %72, %24
  %74 = mul nsw i32 %73, %3
  %75 = add nsw i32 %74, %21
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fmul contract float %78, %78
  %80 = fadd contract float %71, %79
  %81 = or i32 %62, 2
  %82 = add nsw i32 %81, %24
  %83 = mul nsw i32 %82, %3
  %84 = add nsw i32 %83, %21
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = fmul contract float %87, %87
  %89 = fadd contract float %80, %88
  %90 = or i32 %62, 3
  %91 = add nsw i32 %90, %24
  %92 = mul nsw i32 %91, %3
  %93 = add nsw i32 %92, %21
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fmul contract float %96, %96
  %98 = fadd contract float %89, %97
  %99 = or i32 %62, 4
  %100 = add nsw i32 %99, %24
  %101 = mul nsw i32 %100, %3
  %102 = add nsw i32 %101, %21
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = fmul contract float %105, %105
  %107 = fadd contract float %98, %106
  %108 = or i32 %62, 5
  %109 = add nsw i32 %108, %24
  %110 = mul nsw i32 %109, %3
  %111 = add nsw i32 %110, %21
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = fmul contract float %114, %114
  %116 = fadd contract float %107, %115
  %117 = or i32 %62, 6
  %118 = add nsw i32 %117, %24
  %119 = mul nsw i32 %118, %3
  %120 = add nsw i32 %119, %21
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = fmul contract float %123, %123
  %125 = fadd contract float %116, %124
  %126 = or i32 %62, 7
  %127 = add nsw i32 %126, %24
  %128 = mul nsw i32 %127, %3
  %129 = add nsw i32 %128, %21
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = fmul contract float %132, %132
  %134 = fadd contract float %125, %133
  %135 = add nuw nsw i32 %62, 8
  %136 = add i32 %63, 8
  %137 = icmp eq i32 %136, %28
  br i1 %137, label %29, label %60, !llvm.loop !13

138:                                              ; preds = %54, %5
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
