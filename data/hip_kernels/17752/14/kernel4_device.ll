; ModuleID = '../data/hip_kernels/17752/14/main.cu'
source_filename = "../data/hip_kernels/17752/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7kernel4iiiPfS_S_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %157

17:                                               ; preds = %6
  %18 = icmp sgt i32 %0, 0
  br i1 %18, label %19, label %49

19:                                               ; preds = %17
  %20 = mul nsw i32 %2, %0
  %21 = mul nsw i32 %15, %0
  %22 = and i32 %0, 7
  %23 = icmp ult i32 %0, 8
  br i1 %23, label %26, label %24

24:                                               ; preds = %19
  %25 = and i32 %0, -8
  br label %55

26:                                               ; preds = %55, %19
  %27 = phi float [ undef, %19 ], [ %153, %55 ]
  %28 = phi i32 [ 0, %19 ], [ %154, %55 ]
  %29 = phi float [ 0.000000e+00, %19 ], [ %153, %55 ]
  %30 = icmp eq i32 %22, 0
  br i1 %30, label %49, label %31

31:                                               ; preds = %26, %31
  %32 = phi i32 [ %46, %31 ], [ %28, %26 ]
  %33 = phi float [ %45, %31 ], [ %29, %26 ]
  %34 = phi i32 [ %47, %31 ], [ 0, %26 ]
  %35 = add nsw i32 %32, %20
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %32, %21
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %4, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = fsub contract float %38, %42
  %44 = fmul contract float %43, %43
  %45 = fadd contract float %33, %44
  %46 = add nuw nsw i32 %32, 1
  %47 = add i32 %34, 1
  %48 = icmp eq i32 %47, %22
  br i1 %48, label %49, label %31, !llvm.loop !11

49:                                               ; preds = %26, %31, %17
  %50 = phi float [ 0.000000e+00, %17 ], [ %27, %26 ], [ %45, %31 ]
  %51 = mul nsw i32 %2, %1
  %52 = add nsw i32 %15, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %5, i64 %53
  store float %50, float addrspace(1)* %54, align 4, !tbaa !7
  br label %157

55:                                               ; preds = %55, %24
  %56 = phi i32 [ 0, %24 ], [ %154, %55 ]
  %57 = phi float [ 0.000000e+00, %24 ], [ %153, %55 ]
  %58 = phi i32 [ 0, %24 ], [ %155, %55 ]
  %59 = add nsw i32 %56, %20
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = add nsw i32 %56, %21
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %4, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = fsub contract float %62, %66
  %68 = fmul contract float %67, %67
  %69 = fadd contract float %57, %68
  %70 = or i32 %56, 1
  %71 = add nsw i32 %70, %20
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %3, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = add nsw i32 %70, %21
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %4, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fsub contract float %74, %78
  %80 = fmul contract float %79, %79
  %81 = fadd contract float %69, %80
  %82 = or i32 %56, 2
  %83 = add nsw i32 %82, %20
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = add nsw i32 %82, %21
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %4, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = fsub contract float %86, %90
  %92 = fmul contract float %91, %91
  %93 = fadd contract float %81, %92
  %94 = or i32 %56, 3
  %95 = add nsw i32 %94, %20
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %3, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = add nsw i32 %94, %21
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %4, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = fsub contract float %98, %102
  %104 = fmul contract float %103, %103
  %105 = fadd contract float %93, %104
  %106 = or i32 %56, 4
  %107 = add nsw i32 %106, %20
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %3, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = add nsw i32 %106, %21
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %4, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = fsub contract float %110, %114
  %116 = fmul contract float %115, %115
  %117 = fadd contract float %105, %116
  %118 = or i32 %56, 5
  %119 = add nsw i32 %118, %20
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %3, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = add nsw i32 %118, %21
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %4, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fsub contract float %122, %126
  %128 = fmul contract float %127, %127
  %129 = fadd contract float %117, %128
  %130 = or i32 %56, 6
  %131 = add nsw i32 %130, %20
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %3, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = add nsw i32 %130, %21
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %4, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = fsub contract float %134, %138
  %140 = fmul contract float %139, %139
  %141 = fadd contract float %129, %140
  %142 = or i32 %56, 7
  %143 = add nsw i32 %142, %20
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %3, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = add nsw i32 %142, %21
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %4, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !5
  %151 = fsub contract float %146, %150
  %152 = fmul contract float %151, %151
  %153 = fadd contract float %141, %152
  %154 = add nuw nsw i32 %56, 8
  %155 = add i32 %58, 8
  %156 = icmp eq i32 %155, %25
  br i1 %156, label %26, label %55, !llvm.loop !13

157:                                              ; preds = %49, %6
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
