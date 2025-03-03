; ModuleID = '../data/hip_kernels/4307/54/main.cu'
source_filename = "../data/hip_kernels/4307/54/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27yMinDeltaIntegralFracKernelPKfPfiiiS0_S0_S0_S0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = shl i32 %11, 4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add i32 %12, %13
  %15 = freeze i32 %14
  %16 = freeze i32 %4
  %17 = sdiv i32 %15, %16
  %18 = mul i32 %17, %16
  %19 = sub i32 %15, %18
  %20 = freeze i32 %3
  %21 = sdiv i32 %17, %20
  %22 = mul i32 %21, %20
  %23 = sub i32 %17, %22
  %24 = add nsw i32 %23, 1
  %25 = icmp slt i32 %21, %2
  %26 = icmp sgt i32 %3, -1
  %27 = and i1 %26, %25
  %28 = icmp sgt i32 %4, -1
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %184

30:                                               ; preds = %10
  %31 = mul i32 %4, %3
  %32 = mul i32 %31, %21
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = sdiv i32 %21, 4
  %36 = mul i32 %35, 4
  %37 = sub i32 %21, %36
  switch i32 %37, label %46 [
    i32 2, label %38
    i32 0, label %43
  ]

38:                                               ; preds = %30
  %39 = mul nsw i32 %23, %4
  %40 = add nsw i32 %39, %19
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %34, i64 %41
  store float 0.000000e+00, float addrspace(1)* %42, align 4, !tbaa !5
  br label %184

43:                                               ; preds = %30
  %44 = sub nsw i32 0, %3
  %45 = sitofp i32 %44 to float
  br label %56

46:                                               ; preds = %30
  %47 = sdiv i32 %21, 4
  %48 = mul nsw i32 %47, 3
  %49 = icmp sgt i32 %37, 0
  %50 = sext i1 %49 to i32
  %51 = add nsw i32 %48, %37
  %52 = add nsw i32 %51, %50
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %5, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %56

56:                                               ; preds = %46, %43
  %57 = phi contract float [ %45, %43 ], [ %55, %46 ]
  %58 = icmp eq i32 %37, 1
  br i1 %58, label %59, label %64

59:                                               ; preds = %56
  %60 = sitofp i32 %3 to float
  %61 = sdiv i32 %21, 4
  %62 = mul nsw i32 %61, 3
  %63 = add nsw i32 %62, 1
  br label %73

64:                                               ; preds = %56
  %65 = mul nsw i32 %35, 3
  %66 = icmp sgt i32 %37, 1
  %67 = sext i1 %66 to i32
  %68 = add nsw i32 %65, %37
  %69 = add nsw i32 %68, %67
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %6, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %73

73:                                               ; preds = %64, %59
  %74 = phi i32 [ %68, %64 ], [ %63, %59 ]
  %75 = phi contract float [ %72, %64 ], [ %60, %59 ]
  %76 = icmp sgt i32 %37, 2
  %77 = sext i1 %76 to i32
  %78 = add nsw i32 %74, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %7, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = fadd contract float %57, -1.000000e+00
  %83 = tail call float @llvm.ceil.f32(float %82)
  %84 = fptosi float %83 to i32
  %85 = sitofp i32 %84 to float
  %86 = fsub contract float %85, %57
  %87 = fadd contract float %86, 1.000000e+00
  %88 = fadd contract float %81, -1.000000e+00
  %89 = tail call float @llvm.ceil.f32(float %88)
  %90 = fptosi float %89 to i32
  %91 = tail call float @llvm.floor.f32(float %75)
  %92 = fptosi float %91 to i32
  %93 = sitofp i32 %92 to float
  %94 = fsub contract float %75, %93
  %95 = add i32 %19, %90
  %96 = add i32 %95, 1
  %97 = icmp ugt i32 %95, 2147483646
  %98 = add nsw i32 %24, %84
  %99 = icmp slt i32 %98, 1
  %100 = select i1 %97, i1 true, i1 %99
  br i1 %100, label %114, label %101

101:                                              ; preds = %73
  %102 = add nsw i32 %3, -1
  %103 = add i32 %23, %84
  %104 = tail call i32 @llvm.smin.i32(i32 %102, i32 %103)
  %105 = tail call i32 @llvm.smax.i32(i32 %104, i32 0)
  %106 = mul nsw i32 %105, %9
  %107 = add nsw i32 %4, -1
  %108 = tail call i32 @llvm.smin.i32(i32 %107, i32 %95)
  %109 = tail call i32 @llvm.smax.i32(i32 %108, i32 0)
  %110 = add nsw i32 %109, %106
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %8, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %114

114:                                              ; preds = %73, %101
  %115 = phi contract float [ %113, %101 ], [ 0.000000e+00, %73 ]
  %116 = add nsw i32 %24, %92
  %117 = icmp sge i32 %116, %3
  %118 = select i1 %97, i1 true, i1 %117
  br i1 %118, label %131, label %119

119:                                              ; preds = %114
  %120 = add nsw i32 %3, -1
  %121 = tail call i32 @llvm.smin.i32(i32 %120, i32 %116)
  %122 = tail call i32 @llvm.smax.i32(i32 %121, i32 0)
  %123 = mul nsw i32 %122, %9
  %124 = add nsw i32 %4, -1
  %125 = tail call i32 @llvm.smin.i32(i32 %124, i32 %95)
  %126 = tail call i32 @llvm.smax.i32(i32 %125, i32 0)
  %127 = add nsw i32 %126, %123
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %8, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %131

131:                                              ; preds = %114, %119
  %132 = phi contract float [ %130, %119 ], [ 0.000000e+00, %114 ]
  %133 = icmp slt i32 %98, %3
  %134 = select contract i1 %133, float %87, float 1.000000e+00
  %135 = fmul contract float %134, %115
  %136 = fadd contract float %135, 0.000000e+00
  %137 = icmp slt i32 %116, 1
  %138 = select contract i1 %137, float 1.000000e+00, float %94
  %139 = fmul contract float %138, %132
  %140 = fadd contract float %136, %139
  %141 = tail call i32 @llvm.smin.i32(i32 %116, i32 %3)
  %142 = tail call i32 @llvm.smax.i32(i32 %141, i32 0)
  %143 = add nuw nsw i32 %4, 1
  %144 = mul nsw i32 %142, %143
  %145 = tail call i32 @llvm.smin.i32(i32 %96, i32 %4)
  %146 = tail call i32 @llvm.smax.i32(i32 %145, i32 0)
  %147 = add nsw i32 %144, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !5, !amdgpu.noclobber !9
  %151 = fadd contract float %150, %140
  %152 = tail call i32 @llvm.smin.i32(i32 %95, i32 %4)
  %153 = tail call i32 @llvm.smax.i32(i32 %152, i32 0)
  %154 = add nsw i32 %153, %144
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !5, !amdgpu.noclobber !9
  %158 = fsub contract float %151, %157
  %159 = tail call i32 @llvm.smin.i32(i32 %98, i32 %3)
  %160 = tail call i32 @llvm.smax.i32(i32 %159, i32 0)
  %161 = mul nsw i32 %160, %143
  %162 = add nsw i32 %161, %146
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !5, !amdgpu.noclobber !9
  %166 = fsub contract float %158, %165
  %167 = add nsw i32 %153, %161
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !5, !amdgpu.noclobber !9
  %171 = fadd contract float %170, %166
  %172 = icmp ult i32 %95, 2147483647
  %173 = icmp slt i32 %96, %4
  %174 = uitofp i1 %173 to float
  %175 = select i1 %172, float %174, float 0.000000e+00
  %176 = fneg contract float %171
  %177 = fmul contract float %175, %176
  %178 = mul nsw i32 %23, %4
  %179 = add nsw i32 %178, %19
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %34, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !5, !amdgpu.noclobber !9
  %183 = fmul contract float %182, %177
  store float %183, float addrspace(1)* %181, align 4, !tbaa !5
  br label %184

184:                                              ; preds = %38, %131, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{}
