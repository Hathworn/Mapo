; ModuleID = '../data/hip_kernels/17971/1/main.cu'
source_filename = "../data/hip_kernels/17971/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16tissueGPU1KernelPiPfS0_S0_i(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = shl nsw i32 %4, 1
  %16 = icmp slt i32 %14, %4
  br i1 %16, label %17, label %130

17:                                               ; preds = %5
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = add nsw i32 %14, %4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = add nsw i32 %14, %15
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = icmp sgt i32 %4, 0
  br i1 %29, label %30, label %127

30:                                               ; preds = %17
  %31 = and i32 %4, 1
  %32 = icmp eq i32 %4, 1
  br i1 %32, label %95, label %33

33:                                               ; preds = %30
  %34 = and i32 %4, -2
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi float [ 0.000000e+00, %33 ], [ %91, %35 ]
  %37 = phi i32 [ 0, %33 ], [ %92, %35 ]
  %38 = phi i32 [ 0, %33 ], [ %93, %35 ]
  %39 = zext i32 %37 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = add nsw i32 %37, %4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = add nsw i32 %37, %15
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = sub nsw i32 %41, %20
  %51 = tail call i32 @llvm.abs.i32(i32 %50, i1 true)
  %52 = sub nsw i32 %45, %24
  %53 = tail call i32 @llvm.abs.i32(i32 %52, i1 true)
  %54 = add nuw nsw i32 %53, %51
  %55 = sub nsw i32 %49, %28
  %56 = tail call i32 @llvm.abs.i32(i32 %55, i1 true)
  %57 = add nuw nsw i32 %54, %56
  %58 = getelementptr inbounds float, float addrspace(1)* %3, i64 %39
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !11, !amdgpu.noclobber !5
  %60 = zext i32 %57 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !11, !amdgpu.noclobber !5
  %63 = fmul contract float %59, %62
  %64 = fadd contract float %36, %63
  %65 = or i32 %37, 1
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = add nsw i32 %65, %4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = add nsw i32 %65, %15
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = sub nsw i32 %68, %20
  %78 = tail call i32 @llvm.abs.i32(i32 %77, i1 true)
  %79 = sub nsw i32 %72, %24
  %80 = tail call i32 @llvm.abs.i32(i32 %79, i1 true)
  %81 = add nuw nsw i32 %80, %78
  %82 = sub nsw i32 %76, %28
  %83 = tail call i32 @llvm.abs.i32(i32 %82, i1 true)
  %84 = add nuw nsw i32 %81, %83
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %66
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !11, !amdgpu.noclobber !5
  %87 = zext i32 %84 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !11, !amdgpu.noclobber !5
  %90 = fmul contract float %86, %89
  %91 = fadd contract float %64, %90
  %92 = add nuw nsw i32 %37, 2
  %93 = add i32 %38, 2
  %94 = icmp eq i32 %93, %34
  br i1 %94, label %95, label %35, !llvm.loop !13

95:                                               ; preds = %35, %30
  %96 = phi float [ undef, %30 ], [ %91, %35 ]
  %97 = phi float [ 0.000000e+00, %30 ], [ %91, %35 ]
  %98 = phi i32 [ 0, %30 ], [ %92, %35 ]
  %99 = icmp eq i32 %31, 0
  br i1 %99, label %127, label %100

100:                                              ; preds = %95
  %101 = zext i32 %98 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = add nsw i32 %98, %4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = add nsw i32 %98, %15
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = sub nsw i32 %103, %20
  %113 = tail call i32 @llvm.abs.i32(i32 %112, i1 true)
  %114 = sub nsw i32 %107, %24
  %115 = tail call i32 @llvm.abs.i32(i32 %114, i1 true)
  %116 = add nuw nsw i32 %115, %113
  %117 = sub nsw i32 %111, %28
  %118 = tail call i32 @llvm.abs.i32(i32 %117, i1 true)
  %119 = add nuw nsw i32 %116, %118
  %120 = getelementptr inbounds float, float addrspace(1)* %3, i64 %101
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !11, !amdgpu.noclobber !5
  %122 = zext i32 %119 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !11, !amdgpu.noclobber !5
  %125 = fmul contract float %121, %124
  %126 = fadd contract float %97, %125
  br label %127

127:                                              ; preds = %100, %95, %17
  %128 = phi float [ 0.000000e+00, %17 ], [ %96, %95 ], [ %126, %100 ]
  %129 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  store float %128, float addrspace(1)* %129, align 4, !tbaa !11
  br label %130

130:                                              ; preds = %127, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
