; ModuleID = '../data/hip_kernels/2824/2/main.cu'
source_filename = "../data/hip_kernels/2824/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16stencilReadOnly2PfS_iiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add nuw nsw i32 %13, 1
  %15 = add i32 %14, %3
  %16 = add i32 %15, %12
  %17 = icmp slt i32 %16, %2
  br i1 %17, label %18, label %148

18:                                               ; preds = %5
  %19 = sub nsw i32 0, %3
  %20 = icmp sgt i32 %3, 0
  br i1 %20, label %21, label %52

21:                                               ; preds = %18
  %22 = sub nsw i32 1, %3
  %23 = tail call i32 @llvm.smax.i32(i32 %3, i32 %22)
  %24 = add nuw i32 %23, %3
  %25 = add i32 %24, -1
  %26 = and i32 %24, 7
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %47, label %28

28:                                               ; preds = %21, %28
  %29 = phi i32 [ %42, %28 ], [ %19, %21 ]
  %30 = phi float [ %41, %28 ], [ 0.000000e+00, %21 ]
  %31 = phi i32 [ %43, %28 ], [ 0, %21 ]
  %32 = add nsw i32 %29, %16
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = add nsw i32 %29, %3
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %4, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fmul contract float %35, %39
  %41 = fadd contract float %30, %40
  %42 = add nsw i32 %29, 1
  %43 = add nuw nsw i32 %31, 1
  %44 = icmp eq i32 %43, %26
  br i1 %44, label %45, label %28, !llvm.loop !11

45:                                               ; preds = %28
  %46 = sub i32 %26, %3
  br label %47

47:                                               ; preds = %45, %21
  %48 = phi i32 [ %19, %21 ], [ %46, %45 ]
  %49 = phi float [ 0.000000e+00, %21 ], [ %41, %45 ]
  %50 = phi float [ undef, %21 ], [ %41, %45 ]
  %51 = icmp ult i32 %25, 7
  br i1 %51, label %52, label %56

52:                                               ; preds = %56, %47, %18
  %53 = phi float [ 0.000000e+00, %18 ], [ %50, %47 ], [ %145, %56 ]
  %54 = sext i32 %16 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  store float %53, float addrspace(1)* %55, align 4, !tbaa !7
  br label %148

56:                                               ; preds = %47, %56
  %57 = phi i32 [ %146, %56 ], [ %48, %47 ]
  %58 = phi float [ %145, %56 ], [ %49, %47 ]
  %59 = add nsw i32 %57, %16
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = add nsw i32 %57, %3
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %4, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = fmul contract float %62, %66
  %68 = fadd contract float %58, %67
  %69 = add nsw i32 %57, 1
  %70 = add nsw i32 %69, %16
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = add nsw i32 %69, %3
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %4, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fmul contract float %73, %77
  %79 = fadd contract float %68, %78
  %80 = add nsw i32 %57, 2
  %81 = add nsw i32 %80, %16
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = add nsw i32 %80, %3
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %4, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = fmul contract float %84, %88
  %90 = fadd contract float %79, %89
  %91 = add nsw i32 %57, 3
  %92 = add nsw i32 %91, %16
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = add nsw i32 %91, %3
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %4, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = fmul contract float %95, %99
  %101 = fadd contract float %90, %100
  %102 = add nsw i32 %57, 4
  %103 = add nsw i32 %102, %16
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = add nsw i32 %102, %3
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %4, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = fmul contract float %106, %110
  %112 = fadd contract float %101, %111
  %113 = add nsw i32 %57, 5
  %114 = add nsw i32 %113, %16
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = add nsw i32 %113, %3
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %4, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = fmul contract float %117, %121
  %123 = fadd contract float %112, %122
  %124 = add nsw i32 %57, 6
  %125 = add nsw i32 %124, %16
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !5
  %129 = add nsw i32 %124, %3
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %4, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = fmul contract float %128, %132
  %134 = fadd contract float %123, %133
  %135 = add nsw i32 %57, 7
  %136 = add nsw i32 %135, %16
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %140 = add nsw i32 %135, %3
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %4, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !5
  %144 = fmul contract float %139, %143
  %145 = fadd contract float %134, %144
  %146 = add nsw i32 %57, 8
  %147 = icmp slt i32 %146, %3
  br i1 %147, label %56, label %52, !llvm.loop !13

148:                                              ; preds = %5, %52
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14, !12}
!14 = !{!"llvm.loop.mustprogress"}
