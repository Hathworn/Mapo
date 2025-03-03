; ModuleID = '../data/hip_kernels/15063/7/main.cu'
source_filename = "../data/hip_kernels/15063/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9ApplyMat3PfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = mul nsw i32 %12, 148
  %14 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %15 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 3
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 4
  %18 = getelementptr inbounds float, float addrspace(1)* %2, i64 5
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 6
  %20 = getelementptr inbounds float, float addrspace(1)* %2, i64 7
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 8
  %22 = mul nsw i32 %12, 146
  br label %24

23:                                               ; preds = %24
  ret void

24:                                               ; preds = %24, %3
  %25 = phi i32 [ 0, %3 ], [ %161, %24 ]
  %26 = add nsw i32 %25, %13
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %30 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %31 = fmul contract float %29, %30
  %32 = fadd contract float %31, 0.000000e+00
  %33 = or i32 %26, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %37 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %38 = fmul contract float %36, %37
  %39 = fadd contract float %32, %38
  %40 = add nsw i32 %26, 2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %45 = fmul contract float %43, %44
  %46 = fadd contract float %39, %45
  %47 = add nsw i32 %26, 148
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = load float, float addrspace(1)* %16, align 4, !tbaa !7
  %52 = fmul contract float %50, %51
  %53 = fadd contract float %46, %52
  %54 = add nsw i32 %26, 149
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = load float, float addrspace(1)* %17, align 4, !tbaa !7
  %59 = fmul contract float %57, %58
  %60 = fadd contract float %53, %59
  %61 = add nsw i32 %26, 150
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %66 = fmul contract float %64, %65
  %67 = fadd contract float %60, %66
  %68 = add nsw i32 %26, 296
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %73 = fmul contract float %71, %72
  %74 = fadd contract float %67, %73
  %75 = add nsw i32 %26, 297
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %80 = fmul contract float %78, %79
  %81 = fadd contract float %74, %80
  %82 = add nsw i32 %26, 298
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = load float, float addrspace(1)* %21, align 4, !tbaa !7
  %87 = fmul contract float %85, %86
  %88 = fadd contract float %81, %87
  %89 = tail call float @llvm.maxnum.f32(float %88, float 0.000000e+00)
  %90 = add nsw i32 %25, %22
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  store float %89, float addrspace(1)* %92, align 4, !tbaa !7
  %93 = or i32 %25, 1
  %94 = add nsw i32 %93, %13
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %99 = fmul contract float %97, %98
  %100 = fadd contract float %99, 0.000000e+00
  %101 = add nsw i32 %94, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %106 = fmul contract float %104, %105
  %107 = fadd contract float %100, %106
  %108 = add nsw i32 %94, 2
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %107, %113
  %115 = add nsw i32 %94, 148
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = load float, float addrspace(1)* %16, align 4, !tbaa !7
  %120 = fmul contract float %118, %119
  %121 = fadd contract float %114, %120
  %122 = add nsw i32 %94, 149
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7
  %126 = load float, float addrspace(1)* %17, align 4, !tbaa !7
  %127 = fmul contract float %125, %126
  %128 = fadd contract float %121, %127
  %129 = add nsw i32 %94, 150
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %128, %134
  %136 = add nsw i32 %94, 296
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %135, %141
  %143 = add nsw i32 %94, 297
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %148 = fmul contract float %146, %147
  %149 = fadd contract float %142, %148
  %150 = add nsw i32 %94, 298
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7
  %154 = load float, float addrspace(1)* %21, align 4, !tbaa !7
  %155 = fmul contract float %153, %154
  %156 = fadd contract float %149, %155
  %157 = tail call float @llvm.maxnum.f32(float %156, float 0.000000e+00)
  %158 = add nsw i32 %93, %22
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  store float %157, float addrspace(1)* %160, align 4, !tbaa !7
  %161 = add nuw nsw i32 %25, 2
  %162 = icmp eq i32 %161, 146
  br i1 %162, label %23, label %24, !llvm.loop !11
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
