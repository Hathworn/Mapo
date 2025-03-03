; ModuleID = '../data/hip_kernels/4307/51/main.cu'
source_filename = "../data/hip_kernels/4307/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27xMaxDeltaIntegralFracKernelPKfPfiiiS0_S0_S0_S0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 %9) local_unnamed_addr #0 {
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
  br i1 %30, label %31, label %173

31:                                               ; preds = %10
  %32 = mul i32 %4, %3
  %33 = mul i32 %32, %22
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = sdiv i32 %22, 4
  %37 = mul i32 %36, 4
  %38 = sub i32 %22, %37
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %167, label %40

40:                                               ; preds = %31
  %41 = mul nsw i32 %36, 3
  %42 = icmp sgt i32 %38, 1
  %43 = sext i1 %42 to i32
  %44 = add nsw i32 %41, %38
  %45 = add nsw i32 %44, %43
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %5, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  %49 = icmp eq i32 %38, 2
  br i1 %49, label %50, label %53

50:                                               ; preds = %40
  %51 = sub nsw i32 0, %4
  %52 = sitofp i32 %51 to float
  br label %60

53:                                               ; preds = %40
  %54 = icmp sgt i32 %38, 2
  %55 = sext i1 %54 to i32
  %56 = add nsw i32 %44, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %6, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %60

60:                                               ; preds = %53, %50
  %61 = phi contract float [ %52, %50 ], [ %59, %53 ]
  %62 = icmp eq i32 %38, 3
  br i1 %62, label %63, label %65

63:                                               ; preds = %60
  %64 = sitofp i32 %4 to float
  br label %69

65:                                               ; preds = %60
  %66 = sext i32 %44 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %7, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %69

69:                                               ; preds = %65, %63
  %70 = phi contract float [ %64, %63 ], [ %68, %65 ]
  %71 = fadd contract float %61, -1.000000e+00
  %72 = tail call float @llvm.ceil.f32(float %71)
  %73 = fptosi float %72 to i32
  %74 = sitofp i32 %73 to float
  %75 = fsub contract float %74, %61
  %76 = fadd contract float %75, 1.000000e+00
  %77 = tail call float @llvm.floor.f32(float %48)
  %78 = fptosi float %77 to i32
  %79 = tail call float @llvm.floor.f32(float %70)
  %80 = fptosi float %79 to i32
  %81 = sitofp i32 %80 to float
  %82 = fsub contract float %70, %81
  %83 = add nsw i32 %20, %73
  %84 = icmp slt i32 %83, 1
  br i1 %84, label %101, label %85

85:                                               ; preds = %69
  %86 = add nsw i32 %25, %78
  %87 = icmp slt i32 %86, %3
  br i1 %87, label %88, label %101

88:                                               ; preds = %85
  %89 = add nsw i32 %3, -1
  %90 = tail call i32 @llvm.smin.i32(i32 %89, i32 %86)
  %91 = tail call i32 @llvm.smax.i32(i32 %90, i32 0)
  %92 = mul nsw i32 %91, %9
  %93 = add nsw i32 %4, -1
  %94 = add i32 %19, %73
  %95 = tail call i32 @llvm.smin.i32(i32 %93, i32 %94)
  %96 = tail call i32 @llvm.smax.i32(i32 %95, i32 0)
  %97 = add nsw i32 %96, %92
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %8, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %101

101:                                              ; preds = %69, %85, %88
  %102 = phi contract float [ %100, %88 ], [ 0.000000e+00, %85 ], [ 0.000000e+00, %69 ]
  %103 = add nsw i32 %20, %80
  %104 = icmp slt i32 %103, %4
  %105 = add nsw i32 %25, %78
  %106 = icmp slt i32 %105, %3
  %107 = select i1 %104, i1 %106, i1 false
  br i1 %107, label %108, label %120

108:                                              ; preds = %101
  %109 = add nsw i32 %3, -1
  %110 = tail call i32 @llvm.smin.i32(i32 %109, i32 %105)
  %111 = tail call i32 @llvm.smax.i32(i32 %110, i32 0)
  %112 = mul nsw i32 %111, %9
  %113 = add nsw i32 %4, -1
  %114 = tail call i32 @llvm.smin.i32(i32 %113, i32 %103)
  %115 = tail call i32 @llvm.smax.i32(i32 %114, i32 0)
  %116 = add nsw i32 %115, %112
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %8, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %120

120:                                              ; preds = %101, %108
  %121 = phi contract float [ %119, %108 ], [ 0.000000e+00, %101 ]
  %122 = icmp slt i32 %103, 1
  %123 = select contract i1 %122, float 1.000000e+00, float %82
  %124 = fmul contract float %123, %121
  %125 = fadd contract float %124, 0.000000e+00
  %126 = icmp slt i32 %83, %4
  %127 = select contract i1 %126, float %76, float 1.000000e+00
  %128 = fmul contract float %127, %102
  %129 = fadd contract float %128, %125
  %130 = add nsw i32 %105, 1
  %131 = tail call i32 @llvm.smin.i32(i32 %130, i32 %3)
  %132 = tail call i32 @llvm.smax.i32(i32 %131, i32 0)
  %133 = add nuw nsw i32 %4, 1
  %134 = mul nsw i32 %132, %133
  %135 = tail call i32 @llvm.smin.i32(i32 %103, i32 %4)
  %136 = tail call i32 @llvm.smax.i32(i32 %135, i32 0)
  %137 = add nsw i32 %136, %134
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !5, !amdgpu.noclobber !9
  %141 = fadd contract float %140, %129
  %142 = tail call i32 @llvm.smin.i32(i32 %105, i32 %3)
  %143 = tail call i32 @llvm.smax.i32(i32 %142, i32 0)
  %144 = mul nsw i32 %143, %133
  %145 = add nsw i32 %136, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !5, !amdgpu.noclobber !9
  %149 = fsub contract float %141, %148
  %150 = tail call i32 @llvm.smin.i32(i32 %83, i32 %4)
  %151 = tail call i32 @llvm.smax.i32(i32 %150, i32 0)
  %152 = add nsw i32 %151, %134
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !5, !amdgpu.noclobber !9
  %156 = fsub contract float %149, %155
  %157 = add nsw i32 %151, %144
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !5, !amdgpu.noclobber !9
  %161 = fadd contract float %160, %156
  %162 = icmp sgt i32 %105, 0
  %163 = icmp slt i32 %105, %3
  %164 = uitofp i1 %163 to float
  %165 = select i1 %162, float %164, float 0.000000e+00
  %166 = fmul contract float %165, %161
  br label %167

167:                                              ; preds = %31, %120
  %168 = phi float [ %166, %120 ], [ 0.000000e+00, %31 ]
  %169 = mul nsw i32 %24, %4
  %170 = add nsw i32 %169, %19
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %35, i64 %171
  store float %168, float addrspace(1)* %172, align 4, !tbaa !5
  br label %173

173:                                              ; preds = %167, %10
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
