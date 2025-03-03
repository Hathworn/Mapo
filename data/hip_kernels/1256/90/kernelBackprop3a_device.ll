; ModuleID = '../data/hip_kernels/1256/90/main.cu'
source_filename = "../data/hip_kernels/1256/90/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16kernelBackprop3aPfiiiS_i(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %7, %1
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %0, i64 %9
  store float 0.000000e+00, float addrspace(1)* %10, align 4, !tbaa !5
  %11 = icmp sgt i32 %2, 0
  br i1 %11, label %12, label %147

12:                                               ; preds = %6
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !9, !invariant.load !10
  %17 = zext i16 %16 to i32
  %18 = add i32 %7, %5
  %19 = and i32 %2, 7
  %20 = icmp ult i32 %2, 8
  br i1 %20, label %125, label %21

21:                                               ; preds = %12
  %22 = and i32 %2, -8
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi float [ 0.000000e+00, %21 ], [ %121, %23 ]
  %25 = phi i32 [ 0, %21 ], [ %122, %23 ]
  %26 = phi i32 [ 0, %21 ], [ %123, %23 ]
  %27 = add nsw i32 %25, %3
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5
  %31 = mul i32 %25, %17
  %32 = add i32 %18, %31
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %4, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5
  %36 = fmul contract float %30, %35
  %37 = fadd contract float %24, %36
  store float %37, float addrspace(1)* %10, align 4, !tbaa !5
  %38 = or i32 %25, 1
  %39 = add nsw i32 %38, %3
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5
  %43 = mul i32 %38, %17
  %44 = add i32 %18, %43
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5
  %48 = fmul contract float %42, %47
  %49 = fadd contract float %37, %48
  store float %49, float addrspace(1)* %10, align 4, !tbaa !5
  %50 = or i32 %25, 2
  %51 = add nsw i32 %50, %3
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5
  %55 = mul i32 %50, %17
  %56 = add i32 %18, %55
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5
  %60 = fmul contract float %54, %59
  %61 = fadd contract float %49, %60
  store float %61, float addrspace(1)* %10, align 4, !tbaa !5
  %62 = or i32 %25, 3
  %63 = add nsw i32 %62, %3
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5
  %67 = mul i32 %62, %17
  %68 = add i32 %18, %67
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %4, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5
  %72 = fmul contract float %66, %71
  %73 = fadd contract float %61, %72
  store float %73, float addrspace(1)* %10, align 4, !tbaa !5
  %74 = or i32 %25, 4
  %75 = add nsw i32 %74, %3
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  %79 = mul i32 %74, %17
  %80 = add i32 %18, %79
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %4, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5
  %84 = fmul contract float %78, %83
  %85 = fadd contract float %73, %84
  store float %85, float addrspace(1)* %10, align 4, !tbaa !5
  %86 = or i32 %25, 5
  %87 = add nsw i32 %86, %3
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5
  %91 = mul i32 %86, %17
  %92 = add i32 %18, %91
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %4, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5
  %96 = fmul contract float %90, %95
  %97 = fadd contract float %85, %96
  store float %97, float addrspace(1)* %10, align 4, !tbaa !5
  %98 = or i32 %25, 6
  %99 = add nsw i32 %98, %3
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5
  %103 = mul i32 %98, %17
  %104 = add i32 %18, %103
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %4, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5
  %108 = fmul contract float %102, %107
  %109 = fadd contract float %97, %108
  store float %109, float addrspace(1)* %10, align 4, !tbaa !5
  %110 = or i32 %25, 7
  %111 = add nsw i32 %110, %3
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5
  %115 = mul i32 %110, %17
  %116 = add i32 %18, %115
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %4, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !5
  %120 = fmul contract float %114, %119
  %121 = fadd contract float %109, %120
  store float %121, float addrspace(1)* %10, align 4, !tbaa !5
  %122 = add nuw nsw i32 %25, 8
  %123 = add i32 %26, 8
  %124 = icmp eq i32 %123, %22
  br i1 %124, label %125, label %23, !llvm.loop !11

125:                                              ; preds = %23, %12
  %126 = phi float [ 0.000000e+00, %12 ], [ %121, %23 ]
  %127 = phi i32 [ 0, %12 ], [ %122, %23 ]
  %128 = icmp eq i32 %19, 0
  br i1 %128, label %147, label %129

129:                                              ; preds = %125, %129
  %130 = phi float [ %143, %129 ], [ %126, %125 ]
  %131 = phi i32 [ %144, %129 ], [ %127, %125 ]
  %132 = phi i32 [ %145, %129 ], [ 0, %125 ]
  %133 = add nsw i32 %131, %3
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5
  %137 = mul i32 %131, %17
  %138 = add i32 %18, %137
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %4, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !5
  %142 = fmul contract float %136, %141
  %143 = fadd contract float %130, %142
  store float %143, float addrspace(1)* %10, align 4, !tbaa !5
  %144 = add nuw nsw i32 %131, 1
  %145 = add i32 %132, 1
  %146 = icmp eq i32 %145, %19
  br i1 %146, label %147, label %129, !llvm.loop !13

147:                                              ; preds = %125, %129, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
