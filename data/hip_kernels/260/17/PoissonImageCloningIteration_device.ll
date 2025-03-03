; ModuleID = '../data/hip_kernels/260/17/main.cu'
source_filename = "../data/hip_kernels/260/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28PoissonImageCloningIterationPKfS0_S0_Pfii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %15, %4
  %25 = add nsw i32 %24, %23
  %26 = icmp slt i32 %15, %5
  %27 = icmp slt i32 %23, %4
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %175

29:                                               ; preds = %6
  %30 = sext i32 %25 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = fcmp contract ogt float %32, 1.270000e+02
  br i1 %33, label %34, label %175

34:                                               ; preds = %29
  %35 = icmp eq i32 %15, 0
  %36 = icmp eq i32 %23, 0
  %37 = add nsw i32 %5, -1
  %38 = icmp eq i32 %15, %37
  %39 = add nsw i32 %4, -1
  %40 = icmp ne i32 %23, %39
  %41 = select i1 %35, i32 0, i32 %4
  %42 = sub nsw i32 %25, %41
  %43 = add nsw i32 %25, -1
  %44 = select i1 %36, i32 %24, i32 %43
  %45 = select i1 %38, i32 0, i32 %4
  %46 = add nsw i32 %25, %45
  %47 = zext i1 %40 to i32
  %48 = add nsw i32 %25, %47
  br i1 %35, label %54, label %49

49:                                               ; preds = %34
  %50 = sext i32 %42 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fcmp contract ole float %52, 1.270000e+02
  br label %54

54:                                               ; preds = %34, %49
  %55 = phi i1 [ %53, %49 ], [ true, %34 ]
  br i1 %36, label %61, label %56

56:                                               ; preds = %54
  %57 = sext i32 %44 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fcmp contract ole float %59, 1.270000e+02
  br label %61

61:                                               ; preds = %54, %56
  %62 = phi i1 [ %60, %56 ], [ true, %54 ]
  br i1 %38, label %68, label %63

63:                                               ; preds = %61
  %64 = sext i32 %46 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = fcmp contract ole float %66, 1.270000e+02
  br label %68

68:                                               ; preds = %61, %63
  %69 = phi i1 [ %67, %63 ], [ true, %61 ]
  br i1 %40, label %70, label %75

70:                                               ; preds = %68
  %71 = sext i32 %48 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = fcmp contract ole float %73, 1.270000e+02
  br label %75

75:                                               ; preds = %68, %70
  %76 = phi i1 [ %74, %70 ], [ true, %68 ]
  %77 = mul nsw i32 %25, 3
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %78
  store float %80, float addrspace(1)* %81, align 4, !tbaa !7
  %82 = add nsw i32 %77, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = getelementptr inbounds float, float addrspace(1)* %3, i64 %83
  store float %85, float addrspace(1)* %86, align 4, !tbaa !7
  %87 = add nsw i32 %77, 2
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = getelementptr inbounds float, float addrspace(1)* %3, i64 %88
  store float %90, float addrspace(1)* %91, align 4, !tbaa !7
  br i1 %55, label %108, label %92

92:                                               ; preds = %75
  %93 = mul nsw i32 %42, 3
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fadd contract float %80, %96
  store float %97, float addrspace(1)* %81, align 4, !tbaa !7
  %98 = add nsw i32 %93, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = fadd contract float %85, %101
  store float %102, float addrspace(1)* %86, align 4, !tbaa !7
  %103 = add nsw i32 %93, 2
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fadd contract float %90, %106
  store float %107, float addrspace(1)* %91, align 4, !tbaa !7
  br label %108

108:                                              ; preds = %92, %75
  %109 = phi float [ %107, %92 ], [ %90, %75 ]
  %110 = phi float [ %102, %92 ], [ %85, %75 ]
  %111 = phi float [ %97, %92 ], [ %80, %75 ]
  br i1 %62, label %128, label %112

112:                                              ; preds = %108
  %113 = mul nsw i32 %44, 3
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fadd contract float %116, %111
  store float %117, float addrspace(1)* %81, align 4, !tbaa !7
  %118 = add nsw i32 %113, 1
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %2, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = fadd contract float %121, %110
  store float %122, float addrspace(1)* %86, align 4, !tbaa !7
  %123 = add nsw i32 %113, 2
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %2, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %127 = fadd contract float %126, %109
  store float %127, float addrspace(1)* %91, align 4, !tbaa !7
  br label %128

128:                                              ; preds = %112, %108
  %129 = phi float [ %127, %112 ], [ %109, %108 ]
  %130 = phi float [ %122, %112 ], [ %110, %108 ]
  %131 = phi float [ %117, %112 ], [ %111, %108 ]
  br i1 %69, label %148, label %132

132:                                              ; preds = %128
  %133 = mul nsw i32 %46, 3
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %2, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = fadd contract float %136, %131
  store float %137, float addrspace(1)* %81, align 4, !tbaa !7
  %138 = add nsw i32 %133, 1
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %2, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = fadd contract float %141, %130
  store float %142, float addrspace(1)* %86, align 4, !tbaa !7
  %143 = add nsw i32 %133, 2
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = fadd contract float %146, %129
  store float %147, float addrspace(1)* %91, align 4, !tbaa !7
  br label %148

148:                                              ; preds = %132, %128
  %149 = phi float [ %147, %132 ], [ %129, %128 ]
  %150 = phi float [ %142, %132 ], [ %130, %128 ]
  %151 = phi float [ %137, %132 ], [ %131, %128 ]
  br i1 %76, label %168, label %152

152:                                              ; preds = %148
  %153 = mul nsw i32 %48, 3
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %2, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = fadd contract float %156, %151
  store float %157, float addrspace(1)* %81, align 4, !tbaa !7
  %158 = add nsw i32 %153, 1
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %2, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %162 = fadd contract float %161, %150
  store float %162, float addrspace(1)* %86, align 4, !tbaa !7
  %163 = add nsw i32 %153, 2
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %2, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7
  %167 = fadd contract float %166, %149
  store float %167, float addrspace(1)* %91, align 4, !tbaa !7
  br label %168

168:                                              ; preds = %152, %148
  %169 = phi float [ %167, %152 ], [ %149, %148 ]
  %170 = phi float [ %162, %152 ], [ %150, %148 ]
  %171 = phi float [ %157, %152 ], [ %151, %148 ]
  %172 = fmul contract float %171, 2.500000e-01
  store float %172, float addrspace(1)* %81, align 4, !tbaa !7
  %173 = fmul contract float %170, 2.500000e-01
  store float %173, float addrspace(1)* %86, align 4, !tbaa !7
  %174 = fmul contract float %169, 2.500000e-01
  store float %174, float addrspace(1)* %91, align 4, !tbaa !7
  br label %175

175:                                              ; preds = %168, %29, %6
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
