; ModuleID = '../data/hip_kernels/890/31/main.cu'
source_filename = "../data/hip_kernels/890/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_taps = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15pfbFilterSharedPfS_S_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %6, %16
  %18 = add i32 %17, %12
  %19 = mul i32 %18, %10
  %20 = add i32 %19, %11
  %21 = mul nsw i32 %10, %3
  %22 = icmp slt i32 %20, %21
  %23 = sext i32 %20 to i64
  br i1 %22, label %24, label %28

24:                                               ; preds = %4
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %23
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %20
  store float %26, float addrspace(3)* %27, align 4, !tbaa !7
  br label %28

28:                                               ; preds = %4, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %11
  %32 = load float, float addrspace(3)* %31, align 4, !tbaa !7
  %33 = fmul contract float %30, %32
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  store float %33, float addrspace(1)* %34, align 4, !tbaa !7
  %35 = icmp sgt i32 %3, 1
  br i1 %35, label %36, label %64

36:                                               ; preds = %28
  %37 = add i32 %3, -1
  %38 = add i32 %3, -2
  %39 = and i32 %37, 7
  %40 = icmp ult i32 %38, 7
  br i1 %40, label %43, label %41

41:                                               ; preds = %36
  %42 = and i32 %37, -8
  br label %65

43:                                               ; preds = %65, %36
  %44 = phi float [ %33, %36 ], [ %155, %65 ]
  %45 = phi i32 [ 1, %36 ], [ %156, %65 ]
  %46 = icmp eq i32 %39, 0
  br i1 %46, label %64, label %47

47:                                               ; preds = %43, %47
  %48 = phi float [ %60, %47 ], [ %44, %43 ]
  %49 = phi i32 [ %61, %47 ], [ %45, %43 ]
  %50 = phi i32 [ %62, %47 ], [ 0, %43 ]
  %51 = mul nuw nsw i32 %49, %10
  %52 = add nsw i32 %51, %20
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = add nuw i32 %51, %11
  %57 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %56
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %59 = fmul contract float %55, %58
  %60 = fadd contract float %48, %59
  store float %60, float addrspace(1)* %34, align 4, !tbaa !7
  %61 = add nuw nsw i32 %49, 1
  %62 = add i32 %50, 1
  %63 = icmp eq i32 %62, %39
  br i1 %63, label %64, label %47, !llvm.loop !11

64:                                               ; preds = %43, %47, %28
  ret void

65:                                               ; preds = %65, %41
  %66 = phi float [ %33, %41 ], [ %155, %65 ]
  %67 = phi i32 [ 1, %41 ], [ %156, %65 ]
  %68 = phi i32 [ 0, %41 ], [ %157, %65 ]
  %69 = mul nuw nsw i32 %67, %10
  %70 = add nsw i32 %69, %20
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = add nuw i32 %69, %11
  %75 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %77 = fmul contract float %73, %76
  %78 = fadd contract float %66, %77
  store float %78, float addrspace(1)* %34, align 4, !tbaa !7
  %79 = add nuw nsw i32 %67, 1
  %80 = mul nuw nsw i32 %79, %10
  %81 = add nsw i32 %80, %20
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = add nuw i32 %80, %11
  %86 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !7
  %88 = fmul contract float %84, %87
  %89 = fadd contract float %78, %88
  store float %89, float addrspace(1)* %34, align 4, !tbaa !7
  %90 = add nuw nsw i32 %67, 2
  %91 = mul nuw nsw i32 %90, %10
  %92 = add nsw i32 %91, %20
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = add nuw i32 %91, %11
  %97 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %96
  %98 = load float, float addrspace(3)* %97, align 4, !tbaa !7
  %99 = fmul contract float %95, %98
  %100 = fadd contract float %89, %99
  store float %100, float addrspace(1)* %34, align 4, !tbaa !7
  %101 = add nuw nsw i32 %67, 3
  %102 = mul nuw nsw i32 %101, %10
  %103 = add nsw i32 %102, %20
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = add nuw i32 %102, %11
  %108 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %107
  %109 = load float, float addrspace(3)* %108, align 4, !tbaa !7
  %110 = fmul contract float %106, %109
  %111 = fadd contract float %100, %110
  store float %111, float addrspace(1)* %34, align 4, !tbaa !7
  %112 = add nuw nsw i32 %67, 4
  %113 = mul nuw nsw i32 %112, %10
  %114 = add nsw i32 %113, %20
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = add nuw i32 %113, %11
  %119 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %118
  %120 = load float, float addrspace(3)* %119, align 4, !tbaa !7
  %121 = fmul contract float %117, %120
  %122 = fadd contract float %111, %121
  store float %122, float addrspace(1)* %34, align 4, !tbaa !7
  %123 = add nuw nsw i32 %67, 5
  %124 = mul nuw nsw i32 %123, %10
  %125 = add nsw i32 %124, %20
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %129 = add nuw i32 %124, %11
  %130 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %129
  %131 = load float, float addrspace(3)* %130, align 4, !tbaa !7
  %132 = fmul contract float %128, %131
  %133 = fadd contract float %122, %132
  store float %133, float addrspace(1)* %34, align 4, !tbaa !7
  %134 = add nuw nsw i32 %67, 6
  %135 = mul nuw nsw i32 %134, %10
  %136 = add nsw i32 %135, %20
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = add nuw i32 %135, %11
  %141 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %140
  %142 = load float, float addrspace(3)* %141, align 4, !tbaa !7
  %143 = fmul contract float %139, %142
  %144 = fadd contract float %133, %143
  store float %144, float addrspace(1)* %34, align 4, !tbaa !7
  %145 = add nuw nsw i32 %67, 7
  %146 = mul nuw nsw i32 %145, %10
  %147 = add nsw i32 %146, %20
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = add nuw i32 %146, %11
  %152 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_taps, i32 0, i32 %151
  %153 = load float, float addrspace(3)* %152, align 4, !tbaa !7
  %154 = fmul contract float %150, %153
  %155 = fadd contract float %144, %154
  store float %155, float addrspace(1)* %34, align 4, !tbaa !7
  %156 = add nuw nsw i32 %67, 8
  %157 = add i32 %68, 8
  %158 = icmp eq i32 %157, %42
  br i1 %158, label %43, label %65, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
