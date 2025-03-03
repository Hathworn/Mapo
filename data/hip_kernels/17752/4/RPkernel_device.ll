; ModuleID = '../data/hip_kernels/17752/4/main.cu'
source_filename = "../data/hip_kernels/17752/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8RPkerneliiPfS_S_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %1
  br i1 %15, label %16, label %144

16:                                               ; preds = %5
  %17 = icmp sgt i32 %0, 0
  br i1 %17, label %18, label %46

18:                                               ; preds = %16
  %19 = mul nsw i32 %14, %0
  %20 = and i32 %0, 7
  %21 = icmp ult i32 %0, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %18
  %23 = and i32 %0, -8
  br label %50

24:                                               ; preds = %50, %18
  %25 = phi float [ undef, %18 ], [ %140, %50 ]
  %26 = phi i32 [ 0, %18 ], [ %141, %50 ]
  %27 = phi float [ 0.000000e+00, %18 ], [ %140, %50 ]
  %28 = icmp eq i32 %20, 0
  br i1 %28, label %46, label %29

29:                                               ; preds = %24, %29
  %30 = phi i32 [ %43, %29 ], [ %26, %24 ]
  %31 = phi float [ %42, %29 ], [ %27, %24 ]
  %32 = phi i32 [ %44, %29 ], [ 0, %24 ]
  %33 = zext i32 %30 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = add nsw i32 %30, %19
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fsub contract float %35, %39
  %41 = fmul contract float %40, %40
  %42 = fadd contract float %31, %41
  %43 = add nuw nsw i32 %30, 1
  %44 = add i32 %32, 1
  %45 = icmp eq i32 %44, %20
  br i1 %45, label %46, label %29, !llvm.loop !11

46:                                               ; preds = %24, %29, %16
  %47 = phi float [ 0.000000e+00, %16 ], [ %25, %24 ], [ %42, %29 ]
  %48 = sext i32 %14 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  store float %47, float addrspace(1)* %49, align 4, !tbaa !7
  br label %144

50:                                               ; preds = %50, %22
  %51 = phi i32 [ 0, %22 ], [ %141, %50 ]
  %52 = phi float [ 0.000000e+00, %22 ], [ %140, %50 ]
  %53 = phi i32 [ 0, %22 ], [ %142, %50 ]
  %54 = zext i32 %51 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = add nsw i32 %51, %19
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fsub contract float %56, %60
  %62 = fmul contract float %61, %61
  %63 = fadd contract float %52, %62
  %64 = or i32 %51, 1
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = add nsw i32 %64, %19
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %3, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = fsub contract float %67, %71
  %73 = fmul contract float %72, %72
  %74 = fadd contract float %63, %73
  %75 = or i32 %51, 2
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = add nsw i32 %75, %19
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fsub contract float %78, %82
  %84 = fmul contract float %83, %83
  %85 = fadd contract float %74, %84
  %86 = or i32 %51, 3
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = add nsw i32 %86, %19
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %3, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fsub contract float %89, %93
  %95 = fmul contract float %94, %94
  %96 = fadd contract float %85, %95
  %97 = or i32 %51, 4
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = add nsw i32 %97, %19
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %3, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = fsub contract float %100, %104
  %106 = fmul contract float %105, %105
  %107 = fadd contract float %96, %106
  %108 = or i32 %51, 5
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %2, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = add nsw i32 %108, %19
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %3, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fsub contract float %111, %115
  %117 = fmul contract float %116, %116
  %118 = fadd contract float %107, %117
  %119 = or i32 %51, 6
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = add nsw i32 %119, %19
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %3, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fsub contract float %122, %126
  %128 = fmul contract float %127, %127
  %129 = fadd contract float %118, %128
  %130 = or i32 %51, 7
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %2, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = add nsw i32 %130, %19
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %3, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fsub contract float %133, %137
  %139 = fmul contract float %138, %138
  %140 = fadd contract float %129, %139
  %141 = add nuw nsw i32 %51, 8
  %142 = add i32 %53, 8
  %143 = icmp eq i32 %142, %23
  br i1 %143, label %24, label %50, !llvm.loop !13

144:                                              ; preds = %46, %5
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
