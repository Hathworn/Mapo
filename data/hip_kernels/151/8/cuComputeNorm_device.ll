; ModuleID = '../data/hip_kernels/151/8/main.cu'
source_filename = "../data/hip_kernels/151/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13cuComputeNormPfiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %1
  br i1 %15, label %16, label %116

16:                                               ; preds = %5
  %17 = icmp sgt i32 %3, 0
  br i1 %17, label %18, label %112

18:                                               ; preds = %16
  %19 = and i32 %3, 7
  %20 = icmp ult i32 %3, 8
  br i1 %20, label %93, label %21

21:                                               ; preds = %18
  %22 = and i32 %3, -8
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi i32 [ 0, %21 ], [ %90, %23 ]
  %25 = phi float [ 0.000000e+00, %21 ], [ %89, %23 ]
  %26 = phi i32 [ 0, %21 ], [ %91, %23 ]
  %27 = mul nsw i32 %24, %2
  %28 = add i32 %27, %14
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = fmul contract float %31, %31
  %33 = fadd contract float %25, %32
  %34 = or i32 %24, 1
  %35 = mul nsw i32 %34, %2
  %36 = add i32 %35, %14
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fmul contract float %39, %39
  %41 = fadd contract float %33, %40
  %42 = or i32 %24, 2
  %43 = mul nsw i32 %42, %2
  %44 = add i32 %43, %14
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fmul contract float %47, %47
  %49 = fadd contract float %41, %48
  %50 = or i32 %24, 3
  %51 = mul nsw i32 %50, %2
  %52 = add i32 %51, %14
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = fmul contract float %55, %55
  %57 = fadd contract float %49, %56
  %58 = or i32 %24, 4
  %59 = mul nsw i32 %58, %2
  %60 = add i32 %59, %14
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fmul contract float %63, %63
  %65 = fadd contract float %57, %64
  %66 = or i32 %24, 5
  %67 = mul nsw i32 %66, %2
  %68 = add i32 %67, %14
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = fmul contract float %71, %71
  %73 = fadd contract float %65, %72
  %74 = or i32 %24, 6
  %75 = mul nsw i32 %74, %2
  %76 = add i32 %75, %14
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fmul contract float %79, %79
  %81 = fadd contract float %73, %80
  %82 = or i32 %24, 7
  %83 = mul nsw i32 %82, %2
  %84 = add i32 %83, %14
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = fmul contract float %87, %87
  %89 = fadd contract float %81, %88
  %90 = add nuw nsw i32 %24, 8
  %91 = add i32 %26, 8
  %92 = icmp eq i32 %91, %22
  br i1 %92, label %93, label %23, !llvm.loop !11

93:                                               ; preds = %23, %18
  %94 = phi float [ undef, %18 ], [ %89, %23 ]
  %95 = phi i32 [ 0, %18 ], [ %90, %23 ]
  %96 = phi float [ 0.000000e+00, %18 ], [ %89, %23 ]
  %97 = icmp eq i32 %19, 0
  br i1 %97, label %112, label %98

98:                                               ; preds = %93, %98
  %99 = phi i32 [ %109, %98 ], [ %95, %93 ]
  %100 = phi float [ %108, %98 ], [ %96, %93 ]
  %101 = phi i32 [ %110, %98 ], [ 0, %93 ]
  %102 = mul nsw i32 %99, %2
  %103 = add i32 %102, %14
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = fmul contract float %106, %106
  %108 = fadd contract float %100, %107
  %109 = add nuw nsw i32 %99, 1
  %110 = add i32 %101, 1
  %111 = icmp eq i32 %110, %19
  br i1 %111, label %112, label %98, !llvm.loop !13

112:                                              ; preds = %93, %98, %16
  %113 = phi float [ 0.000000e+00, %16 ], [ %94, %93 ], [ %108, %98 ]
  %114 = zext i32 %14 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %4, i64 %114
  store float %113, float addrspace(1)* %115, align 4, !tbaa !7
  br label %116

116:                                              ; preds = %112, %5
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
