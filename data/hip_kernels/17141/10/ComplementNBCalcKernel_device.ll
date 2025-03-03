; ModuleID = '../data/hip_kernels/17141/10/main.cu'
source_filename = "../data/hip_kernels/17141/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22ComplementNBCalcKernelPKfPKiPfS3_jj(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = icmp ult i32 %15, %5
  %17 = icmp ne i32 %4, 0
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %129

19:                                               ; preds = %6
  %20 = zext i32 %15 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %3, i64 %20
  %22 = and i32 %4, 3
  %23 = icmp ult i32 %4, 4
  br i1 %23, label %103, label %24

24:                                               ; preds = %19
  %25 = and i32 %4, -4
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi i32 [ 0, %24 ], [ %100, %26 ]
  %28 = phi i32 [ 0, %24 ], [ %101, %26 ]
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = mul i32 %27, %5
  %33 = add i32 %32, %15
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !11
  %37 = mul i32 %31, %5
  %38 = add i32 %37, %15
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !11
  %42 = fadd contract float %36, %41
  store float %42, float addrspace(1)* %40, align 4, !tbaa !11
  %43 = load float, float addrspace(1)* %35, align 4, !tbaa !11
  %44 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %45 = fadd contract float %43, %44
  store float %45, float addrspace(1)* %21, align 4, !tbaa !11
  %46 = or i32 %27, 1
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = mul i32 %46, %5
  %51 = add i32 %50, %15
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !11
  %55 = mul i32 %49, %5
  %56 = add i32 %55, %15
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !11
  %60 = fadd contract float %54, %59
  store float %60, float addrspace(1)* %58, align 4, !tbaa !11
  %61 = load float, float addrspace(1)* %53, align 4, !tbaa !11
  %62 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %63 = fadd contract float %61, %62
  store float %63, float addrspace(1)* %21, align 4, !tbaa !11
  %64 = or i32 %27, 2
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = mul i32 %64, %5
  %69 = add i32 %68, %15
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !11
  %73 = mul i32 %67, %5
  %74 = add i32 %73, %15
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !11
  %78 = fadd contract float %72, %77
  store float %78, float addrspace(1)* %76, align 4, !tbaa !11
  %79 = load float, float addrspace(1)* %71, align 4, !tbaa !11
  %80 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %81 = fadd contract float %79, %80
  store float %81, float addrspace(1)* %21, align 4, !tbaa !11
  %82 = or i32 %27, 3
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !6
  %86 = mul i32 %82, %5
  %87 = add i32 %86, %15
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !11
  %91 = mul i32 %85, %5
  %92 = add i32 %91, %15
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !11
  %96 = fadd contract float %90, %95
  store float %96, float addrspace(1)* %94, align 4, !tbaa !11
  %97 = load float, float addrspace(1)* %89, align 4, !tbaa !11
  %98 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %99 = fadd contract float %97, %98
  store float %99, float addrspace(1)* %21, align 4, !tbaa !11
  %100 = add nuw i32 %27, 4
  %101 = add i32 %28, 4
  %102 = icmp eq i32 %101, %25
  br i1 %102, label %103, label %26, !llvm.loop !13

103:                                              ; preds = %26, %19
  %104 = phi i32 [ 0, %19 ], [ %100, %26 ]
  %105 = icmp eq i32 %22, 0
  br i1 %105, label %129, label %106

106:                                              ; preds = %103, %106
  %107 = phi i32 [ %126, %106 ], [ %104, %103 ]
  %108 = phi i32 [ %127, %106 ], [ 0, %103 ]
  %109 = zext i32 %107 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !6
  %112 = mul i32 %107, %5
  %113 = add i32 %112, %15
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !11
  %117 = mul i32 %111, %5
  %118 = add i32 %117, %15
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %2, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !11
  %122 = fadd contract float %116, %121
  store float %122, float addrspace(1)* %120, align 4, !tbaa !11
  %123 = load float, float addrspace(1)* %115, align 4, !tbaa !11
  %124 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %125 = fadd contract float %123, %124
  store float %125, float addrspace(1)* %21, align 4, !tbaa !11
  %126 = add nuw i32 %107, 1
  %127 = add i32 %108, 1
  %128 = icmp eq i32 %127, %22
  br i1 %128, label %129, label %106, !llvm.loop !15

129:                                              ; preds = %103, %106, %6
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
