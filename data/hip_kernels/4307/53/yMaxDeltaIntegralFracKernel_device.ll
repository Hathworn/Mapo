; ModuleID = '../data/hip_kernels/4307/53/main.cu'
source_filename = "../data/hip_kernels/4307/53/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27yMaxDeltaIntegralFracKernelPKfPfiiiS0_S0_S0_S0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = shl i32 %11, 4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add i32 %12, %13
  %15 = freeze i32 %14
  %16 = freeze i32 %4
  %17 = sdiv i32 %15, %16
  %18 = mul i32 %17, %16
  %19 = sub i32 %15, %18
  %20 = add nsw i32 %19, 1
  %21 = freeze i32 %3
  %22 = sdiv i32 %17, %21
  %23 = mul i32 %22, %21
  %24 = sub i32 %17, %23
  %25 = add nsw i32 %24, 1
  %26 = icmp slt i32 %22, %2
  %27 = icmp sgt i32 %3, -1
  %28 = and i1 %27, %26
  %29 = icmp sgt i32 %4, -1
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %174

31:                                               ; preds = %10
  %32 = mul i32 %4, %3
  %33 = mul i32 %32, %22
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = sdiv i32 %22, 4
  %37 = mul i32 %36, 4
  %38 = sub i32 %22, %37
  switch i32 %38, label %42 [
    i32 3, label %168
    i32 0, label %39
  ]

39:                                               ; preds = %31
  %40 = sub nsw i32 0, %3
  %41 = sitofp i32 %40 to float
  br label %52

42:                                               ; preds = %31
  %43 = sdiv i32 %22, 4
  %44 = mul nsw i32 %43, 3
  %45 = icmp sgt i32 %38, 0
  %46 = sext i1 %45 to i32
  %47 = add nsw i32 %44, %38
  %48 = add nsw i32 %47, %46
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %5, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %52

52:                                               ; preds = %42, %39
  %53 = phi contract float [ %41, %39 ], [ %51, %42 ]
  %54 = icmp eq i32 %38, 1
  br i1 %54, label %55, label %60

55:                                               ; preds = %52
  %56 = sitofp i32 %3 to float
  %57 = sdiv i32 %22, 4
  %58 = mul nsw i32 %57, 3
  %59 = add nsw i32 %58, 1
  br label %69

60:                                               ; preds = %52
  %61 = mul nsw i32 %36, 3
  %62 = icmp sgt i32 %38, 1
  %63 = sext i1 %62 to i32
  %64 = add nsw i32 %61, %38
  %65 = add nsw i32 %64, %63
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %6, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %69

69:                                               ; preds = %60, %55
  %70 = phi i32 [ %64, %60 ], [ %59, %55 ]
  %71 = phi contract float [ %68, %60 ], [ %56, %55 ]
  %72 = sext i32 %70 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %7, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5, !amdgpu.noclobber !9
  %75 = fadd contract float %53, -1.000000e+00
  %76 = tail call float @llvm.ceil.f32(float %75)
  %77 = fptosi float %76 to i32
  %78 = sitofp i32 %77 to float
  %79 = fsub contract float %78, %53
  %80 = fadd contract float %79, 1.000000e+00
  %81 = tail call float @llvm.floor.f32(float %71)
  %82 = fptosi float %81 to i32
  %83 = sitofp i32 %82 to float
  %84 = fsub contract float %71, %83
  %85 = tail call float @llvm.floor.f32(float %74)
  %86 = fptosi float %85 to i32
  %87 = add nsw i32 %20, %86
  %88 = icmp slt i32 %87, %4
  %89 = add nsw i32 %25, %77
  %90 = icmp sgt i32 %89, 0
  %91 = select i1 %88, i1 %90, i1 false
  br i1 %91, label %92, label %105

92:                                               ; preds = %69
  %93 = add nsw i32 %3, -1
  %94 = add i32 %24, %77
  %95 = tail call i32 @llvm.smin.i32(i32 %93, i32 %94)
  %96 = tail call i32 @llvm.smax.i32(i32 %95, i32 0)
  %97 = mul nsw i32 %96, %9
  %98 = add nsw i32 %4, -1
  %99 = tail call i32 @llvm.smin.i32(i32 %98, i32 %87)
  %100 = tail call i32 @llvm.smax.i32(i32 %99, i32 0)
  %101 = add nsw i32 %100, %97
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %8, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %105

105:                                              ; preds = %69, %92
  %106 = phi contract float [ %104, %92 ], [ 0.000000e+00, %69 ]
  %107 = add nsw i32 %25, %82
  %108 = icmp slt i32 %107, %3
  %109 = select i1 %88, i1 %108, i1 false
  br i1 %109, label %110, label %122

110:                                              ; preds = %105
  %111 = add nsw i32 %3, -1
  %112 = tail call i32 @llvm.smin.i32(i32 %111, i32 %107)
  %113 = tail call i32 @llvm.smax.i32(i32 %112, i32 0)
  %114 = mul nsw i32 %113, %9
  %115 = add nsw i32 %4, -1
  %116 = tail call i32 @llvm.smin.i32(i32 %115, i32 %87)
  %117 = tail call i32 @llvm.smax.i32(i32 %116, i32 0)
  %118 = add nsw i32 %114, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %8, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %122

122:                                              ; preds = %105, %110
  %123 = phi contract float [ %121, %110 ], [ 0.000000e+00, %105 ]
  %124 = icmp slt i32 %89, %3
  %125 = select contract i1 %124, float %80, float 1.000000e+00
  %126 = fmul contract float %125, %106
  %127 = fadd contract float %126, 0.000000e+00
  %128 = icmp slt i32 %107, 1
  %129 = select contract i1 %128, float 1.000000e+00, float %84
  %130 = fmul contract float %129, %123
  %131 = fadd contract float %127, %130
  %132 = tail call i32 @llvm.smin.i32(i32 %107, i32 %3)
  %133 = tail call i32 @llvm.smax.i32(i32 %132, i32 0)
  %134 = add nuw nsw i32 %4, 1
  %135 = mul nsw i32 %133, %134
  %136 = add nsw i32 %87, 1
  %137 = tail call i32 @llvm.smin.i32(i32 %136, i32 %4)
  %138 = tail call i32 @llvm.smax.i32(i32 %137, i32 0)
  %139 = add nsw i32 %138, %135
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !5, !amdgpu.noclobber !9
  %143 = fadd contract float %142, %131
  %144 = tail call i32 @llvm.smin.i32(i32 %87, i32 %4)
  %145 = tail call i32 @llvm.smax.i32(i32 %144, i32 0)
  %146 = add nsw i32 %135, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !5, !amdgpu.noclobber !9
  %150 = fsub contract float %143, %149
  %151 = tail call i32 @llvm.smin.i32(i32 %89, i32 %3)
  %152 = tail call i32 @llvm.smax.i32(i32 %151, i32 0)
  %153 = mul nsw i32 %152, %134
  %154 = add nsw i32 %138, %153
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !5, !amdgpu.noclobber !9
  %158 = fsub contract float %150, %157
  %159 = add nsw i32 %145, %153
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %0, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !5, !amdgpu.noclobber !9
  %163 = fadd contract float %162, %158
  %164 = icmp sgt i32 %87, 0
  %165 = uitofp i1 %88 to float
  %166 = select i1 %164, float %165, float 0.000000e+00
  %167 = fmul contract float %166, %163
  br label %168

168:                                              ; preds = %31, %122
  %169 = phi float [ %167, %122 ], [ 0.000000e+00, %31 ]
  %170 = mul nsw i32 %24, %4
  %171 = add nsw i32 %170, %19
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %35, i64 %172
  store float %169, float addrspace(1)* %173, align 4, !tbaa !5
  br label %174

174:                                              ; preds = %168, %10
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
