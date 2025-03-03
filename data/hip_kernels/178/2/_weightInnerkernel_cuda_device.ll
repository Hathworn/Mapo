; ModuleID = '../data/hip_kernels/178/2/main.cu'
source_filename = "../data/hip_kernels/178/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23_weightInnerkernel_cudaiifPfS_S_S_(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add nuw nsw i32 %15, 1
  %17 = add i32 %16, %14
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add nuw nsw i32 %24, 1
  %26 = add i32 %25, %23
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %28 = icmp uge i32 %27, %0
  %29 = icmp eq i32 %26, 0
  %30 = select i1 %28, i1 true, i1 %29
  br i1 %30, label %175, label %31

31:                                               ; preds = %7
  %32 = add nsw i32 %1, -1
  %33 = icmp ult i32 %26, %32
  %34 = icmp ne i32 %17, 0
  %35 = select i1 %33, i1 %34, i1 false
  %36 = icmp ult i32 %17, %32
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %175

38:                                               ; preds = %31
  %39 = mul i32 %27, %1
  %40 = add i32 %26, %39
  %41 = mul i32 %40, %1
  %42 = add i32 %41, %17
  %43 = add nsw i32 %42, 1
  %44 = add nsw i32 %42, -1
  %45 = add nsw i32 %42, %1
  %46 = sub nsw i32 %42, %1
  %47 = add nsw i32 %45, 1
  %48 = add nsw i32 %45, -1
  %49 = add nsw i32 %46, 1
  %50 = add nsw i32 %46, -1
  %51 = fmul contract float %2, 2.000000e+00
  %52 = sext i32 %42 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  %54 = getelementptr inbounds float, float addrspace(1)* %6, i64 %52
  %55 = getelementptr inbounds float, float addrspace(1)* %4, i64 %52
  %56 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %57 = fmul contract float %51, %56
  %58 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %59 = fadd contract float %58, %57
  store float %59, float addrspace(1)* %53, align 4, !tbaa !7
  %60 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %61 = fmul contract float %51, %60
  %62 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %63 = sext i32 %43 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %6, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = fadd contract float %62, %65
  %67 = fmul contract float %61, %66
  %68 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %69 = fsub contract float %68, %67
  store float %69, float addrspace(1)* %55, align 4, !tbaa !7
  %70 = getelementptr inbounds float, float addrspace(1)* %5, i64 1
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = fmul contract float %51, %71
  %73 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %74 = fadd contract float %73, %72
  store float %74, float addrspace(1)* %53, align 4, !tbaa !7
  %75 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %76 = fmul contract float %51, %75
  %77 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %78 = sext i32 %44 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %6, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = fadd contract float %77, %80
  %82 = fmul contract float %76, %81
  %83 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %84 = fsub contract float %83, %82
  store float %84, float addrspace(1)* %55, align 4, !tbaa !7
  %85 = getelementptr inbounds float, float addrspace(1)* %5, i64 2
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fmul contract float %51, %86
  %88 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %89 = fadd contract float %88, %87
  store float %89, float addrspace(1)* %53, align 4, !tbaa !7
  %90 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %91 = fmul contract float %51, %90
  %92 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %93 = sext i32 %45 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %6, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = fadd contract float %92, %95
  %97 = fmul contract float %91, %96
  %98 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %99 = fsub contract float %98, %97
  store float %99, float addrspace(1)* %55, align 4, !tbaa !7
  %100 = getelementptr inbounds float, float addrspace(1)* %5, i64 3
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = fmul contract float %51, %101
  %103 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %104 = fadd contract float %103, %102
  store float %104, float addrspace(1)* %53, align 4, !tbaa !7
  %105 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %106 = fmul contract float %51, %105
  %107 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %108 = sext i32 %46 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %6, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = fadd contract float %107, %110
  %112 = fmul contract float %106, %111
  %113 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %114 = fsub contract float %113, %112
  store float %114, float addrspace(1)* %55, align 4, !tbaa !7
  %115 = getelementptr inbounds float, float addrspace(1)* %5, i64 4
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fmul contract float %51, %116
  %118 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %119 = fadd contract float %118, %117
  store float %119, float addrspace(1)* %53, align 4, !tbaa !7
  %120 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %121 = fmul contract float %51, %120
  %122 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %123 = sext i32 %47 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %6, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7
  %126 = fadd contract float %122, %125
  %127 = fmul contract float %121, %126
  %128 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %129 = fsub contract float %128, %127
  store float %129, float addrspace(1)* %55, align 4, !tbaa !7
  %130 = getelementptr inbounds float, float addrspace(1)* %5, i64 5
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fmul contract float %51, %131
  %133 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %134 = fadd contract float %133, %132
  store float %134, float addrspace(1)* %53, align 4, !tbaa !7
  %135 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %136 = fmul contract float %51, %135
  %137 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %138 = sext i32 %48 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %6, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %141 = fadd contract float %137, %140
  %142 = fmul contract float %136, %141
  %143 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %144 = fsub contract float %143, %142
  store float %144, float addrspace(1)* %55, align 4, !tbaa !7
  %145 = getelementptr inbounds float, float addrspace(1)* %5, i64 6
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = fmul contract float %51, %146
  %148 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %149 = fadd contract float %148, %147
  store float %149, float addrspace(1)* %53, align 4, !tbaa !7
  %150 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %151 = fmul contract float %51, %150
  %152 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %153 = sext i32 %49 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %6, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  %156 = fadd contract float %152, %155
  %157 = fmul contract float %151, %156
  %158 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %159 = fsub contract float %158, %157
  store float %159, float addrspace(1)* %55, align 4, !tbaa !7
  %160 = getelementptr inbounds float, float addrspace(1)* %5, i64 7
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %162 = fmul contract float %51, %161
  %163 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %164 = fadd contract float %163, %162
  store float %164, float addrspace(1)* %53, align 4, !tbaa !7
  %165 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %166 = fmul contract float %51, %165
  %167 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %168 = sext i32 %50 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %6, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7
  %171 = fadd contract float %167, %170
  %172 = fmul contract float %166, %171
  %173 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %174 = fsub contract float %173, %172
  store float %174, float addrspace(1)* %55, align 4, !tbaa !7
  br label %175

175:                                              ; preds = %38, %7, %31
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
