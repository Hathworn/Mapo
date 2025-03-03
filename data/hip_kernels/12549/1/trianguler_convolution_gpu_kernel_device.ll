; ModuleID = '../data/hip_kernels/12549/1/main.cu'
source_filename = "../data/hip_kernels/12549/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@lTable_const = protected local_unnamed_addr addrspace(4) externally_initialized global [1064 x float] zeroinitializer, align 16
@mr_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mg_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mb_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z33trianguler_convolution_gpu_kernelPfS_S_S_S_iiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, i32 %5, i32 %6, float %7, float %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = add i32 %17, %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = add i32 %25, %19
  %27 = icmp ult i32 %18, %5
  %28 = icmp ult i32 %26, %6
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %168

30:                                               ; preds = %9
  %31 = mul i32 %26, %5
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = mul nsw i32 %6, %5
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %33, i64 %35
  %37 = shl i32 %5, 1
  %38 = mul i32 %37, %6
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %33, i64 %39
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %42 = getelementptr inbounds float, float addrspace(1)* %41, i64 %35
  %43 = getelementptr inbounds float, float addrspace(1)* %41, i64 %39
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %32
  %47 = icmp eq i32 %26, 0
  %48 = sext i32 %5 to i64
  %49 = sub nsw i64 0, %48
  %50 = select i1 %47, i64 0, i64 %49
  %51 = getelementptr float, float addrspace(1)* %40, i64 %50
  %52 = getelementptr float, float addrspace(1)* %36, i64 %50
  %53 = getelementptr float, float addrspace(1)* %33, i64 %50
  %54 = add nsw i32 %6, -1
  %55 = icmp ult i32 %26, %54
  %56 = select i1 %55, i64 %48, i64 0
  %57 = getelementptr float, float addrspace(1)* %40, i64 %56
  %58 = getelementptr float, float addrspace(1)* %36, i64 %56
  %59 = getelementptr float, float addrspace(1)* %33, i64 %56
  %60 = zext i32 %18 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %53, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = getelementptr inbounds float, float addrspace(1)* %33, i64 %60
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = fmul contract float %64, %8
  %66 = fadd contract float %62, %65
  %67 = getelementptr inbounds float, float addrspace(1)* %59, i64 %60
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fadd contract float %68, %66
  %70 = fmul contract float %69, %7
  %71 = getelementptr inbounds float, float addrspace(1)* %44, i64 %60
  store float %70, float addrspace(1)* %71, align 4, !tbaa !7
  %72 = getelementptr inbounds float, float addrspace(1)* %52, i64 %60
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = getelementptr inbounds float, float addrspace(1)* %36, i64 %60
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = fmul contract float %75, %8
  %77 = fadd contract float %73, %76
  %78 = getelementptr inbounds float, float addrspace(1)* %58, i64 %60
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fadd contract float %79, %77
  %81 = fmul contract float %80, %7
  %82 = getelementptr inbounds float, float addrspace(1)* %45, i64 %60
  store float %81, float addrspace(1)* %82, align 4, !tbaa !7
  %83 = getelementptr inbounds float, float addrspace(1)* %51, i64 %60
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = getelementptr inbounds float, float addrspace(1)* %40, i64 %60
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fmul contract float %86, %8
  %88 = fadd contract float %84, %87
  %89 = getelementptr inbounds float, float addrspace(1)* %57, i64 %60
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = fadd contract float %90, %88
  %92 = fmul contract float %91, %7
  %93 = getelementptr inbounds float, float addrspace(1)* %46, i64 %60
  store float %92, float addrspace(1)* %93, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %94 = icmp eq i32 %18, 0
  br i1 %94, label %95, label %114

95:                                               ; preds = %30
  %96 = fadd contract float %8, 1.000000e+00
  %97 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %98 = fmul contract float %96, %97
  %99 = getelementptr inbounds float, float addrspace(1)* %44, i64 1
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = fadd contract float %98, %100
  %102 = getelementptr inbounds float, float addrspace(1)* %41, i64 %60
  store float %101, float addrspace(1)* %102, align 4, !tbaa !7
  %103 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %104 = fmul contract float %96, %103
  %105 = getelementptr inbounds float, float addrspace(1)* %45, i64 1
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fadd contract float %104, %106
  %108 = getelementptr inbounds float, float addrspace(1)* %42, i64 %60
  store float %107, float addrspace(1)* %108, align 4, !tbaa !7
  %109 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %110 = fmul contract float %96, %109
  %111 = getelementptr inbounds float, float addrspace(1)* %46, i64 1
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = fadd contract float %110, %112
  br label %165

114:                                              ; preds = %30
  %115 = add nsw i32 %5, -1
  %116 = icmp eq i32 %18, %115
  %117 = add i32 %18, -1
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %44, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  br i1 %116, label %121, label %138

121:                                              ; preds = %114
  %122 = fadd contract float %8, 1.000000e+00
  %123 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %120, %124
  %126 = getelementptr inbounds float, float addrspace(1)* %41, i64 %60
  store float %125, float addrspace(1)* %126, align 4, !tbaa !7
  %127 = getelementptr inbounds float, float addrspace(1)* %45, i64 %118
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %129 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %130 = fmul contract float %122, %129
  %131 = fadd contract float %128, %130
  %132 = getelementptr inbounds float, float addrspace(1)* %42, i64 %60
  store float %131, float addrspace(1)* %132, align 4, !tbaa !7
  %133 = getelementptr inbounds float, float addrspace(1)* %46, i64 %118
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %136 = fmul contract float %122, %135
  %137 = fadd contract float %134, %136
  br label %165

138:                                              ; preds = %114
  %139 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %140 = fmul contract float %139, %8
  %141 = fadd contract float %120, %140
  %142 = add nuw i32 %18, 1
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %44, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7
  %146 = fadd contract float %145, %141
  %147 = getelementptr inbounds float, float addrspace(1)* %41, i64 %60
  store float %146, float addrspace(1)* %147, align 4, !tbaa !7
  %148 = getelementptr inbounds float, float addrspace(1)* %45, i64 %118
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %151 = fmul contract float %150, %8
  %152 = fadd contract float %149, %151
  %153 = getelementptr inbounds float, float addrspace(1)* %45, i64 %143
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7
  %155 = fadd contract float %154, %152
  %156 = getelementptr inbounds float, float addrspace(1)* %42, i64 %60
  store float %155, float addrspace(1)* %156, align 4, !tbaa !7
  %157 = getelementptr inbounds float, float addrspace(1)* %46, i64 %118
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %159 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %160 = fmul contract float %159, %8
  %161 = fadd contract float %158, %160
  %162 = getelementptr inbounds float, float addrspace(1)* %46, i64 %143
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %164 = fadd contract float %163, %161
  br label %165

165:                                              ; preds = %121, %138, %95
  %166 = phi float [ %137, %121 ], [ %164, %138 ], [ %113, %95 ]
  %167 = getelementptr inbounds float, float addrspace(1)* %43, i64 %60
  store float %166, float addrspace(1)* %167, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %168

168:                                              ; preds = %165, %9
  ret void
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
