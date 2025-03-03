; ModuleID = '../data/hip_kernels/11972/3/main.cu'
source_filename = "../data/hip_kernels/11972/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @sumSquareError(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %173

19:                                               ; preds = %8
  %20 = mul i32 %2, %1
  %21 = mul i32 %20, %17
  %22 = mul nsw i32 %21, %3
  %23 = mul nsw i32 %17, %3
  %24 = sext i32 %17 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %7, i64 %24
  store float 0.000000e+00, float addrspace(1)* %25, align 4, !tbaa !7
  %26 = icmp sgt i32 %20, 0
  br i1 %26, label %27, label %173

27:                                               ; preds = %19
  %28 = icmp sgt i32 %3, 0
  %29 = and i32 %3, 7
  %30 = icmp ult i32 %3, 8
  %31 = and i32 %3, -8
  %32 = icmp eq i32 %29, 0
  br label %33

33:                                               ; preds = %27, %60
  %34 = phi float [ 0.000000e+00, %27 ], [ %68, %60 ]
  %35 = phi i32 [ 0, %27 ], [ %69, %60 ]
  br i1 %28, label %36, label %60

36:                                               ; preds = %33
  %37 = add i32 %35, %22
  br i1 %30, label %38, label %71

38:                                               ; preds = %71, %36
  %39 = phi float [ undef, %36 ], [ %169, %71 ]
  %40 = phi i32 [ 0, %36 ], [ %170, %71 ]
  %41 = phi float [ 0.000000e+00, %36 ], [ %169, %71 ]
  br i1 %32, label %60, label %42

42:                                               ; preds = %38, %42
  %43 = phi i32 [ %57, %42 ], [ %40, %38 ]
  %44 = phi float [ %56, %42 ], [ %41, %38 ]
  %45 = phi i32 [ %58, %42 ], [ 0, %38 ]
  %46 = mul nsw i32 %43, %20
  %47 = add i32 %37, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = add nsw i32 %43, %23
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %5, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = fmul contract float %50, %54
  %56 = fadd contract float %44, %55
  %57 = add nuw nsw i32 %43, 1
  %58 = add i32 %45, 1
  %59 = icmp eq i32 %58, %29
  br i1 %59, label %60, label %42, !llvm.loop !11

60:                                               ; preds = %38, %42, %33
  %61 = phi float [ 0.000000e+00, %33 ], [ %39, %38 ], [ %56, %42 ]
  %62 = add nsw i32 %35, %21
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %6, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = fsub contract float %65, %61
  %67 = fmul contract float %66, %66
  %68 = fadd contract float %34, %67
  store float %68, float addrspace(1)* %25, align 4, !tbaa !7
  %69 = add nuw nsw i32 %35, 1
  %70 = icmp eq i32 %69, %20
  br i1 %70, label %173, label %33, !llvm.loop !13

71:                                               ; preds = %36, %71
  %72 = phi i32 [ %170, %71 ], [ 0, %36 ]
  %73 = phi float [ %169, %71 ], [ 0.000000e+00, %36 ]
  %74 = phi i32 [ %171, %71 ], [ 0, %36 ]
  %75 = mul nsw i32 %72, %20
  %76 = add i32 %37, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %4, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = add nsw i32 %72, %23
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %5, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = fmul contract float %79, %83
  %85 = fadd contract float %73, %84
  %86 = or i32 %72, 1
  %87 = mul nsw i32 %86, %20
  %88 = add i32 %37, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %4, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = add nsw i32 %86, %23
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %5, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = fmul contract float %91, %95
  %97 = fadd contract float %85, %96
  %98 = or i32 %72, 2
  %99 = mul nsw i32 %98, %20
  %100 = add i32 %37, %99
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %4, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = add nsw i32 %98, %23
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %5, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = fmul contract float %103, %107
  %109 = fadd contract float %97, %108
  %110 = or i32 %72, 3
  %111 = mul nsw i32 %110, %20
  %112 = add i32 %37, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %4, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = add nsw i32 %110, %23
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %5, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = fmul contract float %115, %119
  %121 = fadd contract float %109, %120
  %122 = or i32 %72, 4
  %123 = mul nsw i32 %122, %20
  %124 = add i32 %37, %123
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %4, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = add nsw i32 %122, %23
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %5, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fmul contract float %127, %131
  %133 = fadd contract float %121, %132
  %134 = or i32 %72, 5
  %135 = mul nsw i32 %134, %20
  %136 = add i32 %37, %135
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %4, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = add nsw i32 %134, %23
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %5, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7
  %144 = fmul contract float %139, %143
  %145 = fadd contract float %133, %144
  %146 = or i32 %72, 6
  %147 = mul nsw i32 %146, %20
  %148 = add i32 %37, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %4, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7
  %152 = add nsw i32 %146, %23
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %5, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  %156 = fmul contract float %151, %155
  %157 = fadd contract float %145, %156
  %158 = or i32 %72, 7
  %159 = mul nsw i32 %158, %20
  %160 = add i32 %37, %159
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %4, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %164 = add nsw i32 %158, %23
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %5, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7
  %168 = fmul contract float %163, %167
  %169 = fadd contract float %157, %168
  %170 = add nuw nsw i32 %72, 8
  %171 = add i32 %74, 8
  %172 = icmp eq i32 %171, %31
  br i1 %172, label %38, label %71, !llvm.loop !15

173:                                              ; preds = %60, %19, %8
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
!15 = distinct !{!15, !14}
