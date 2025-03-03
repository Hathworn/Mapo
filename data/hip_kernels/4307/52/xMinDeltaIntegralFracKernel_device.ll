; ModuleID = '../data/hip_kernels/4307/52/main.cu'
source_filename = "../data/hip_kernels/4307/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27xMinDeltaIntegralFracKernelPKfPfiiiS0_S0_S0_S0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 %9) local_unnamed_addr #0 {
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
  %25 = icmp slt i32 %22, %2
  %26 = icmp sgt i32 %3, -1
  %27 = and i1 %26, %25
  %28 = icmp sgt i32 %4, -1
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %177

30:                                               ; preds = %10
  %31 = mul i32 %4, %3
  %32 = mul i32 %31, %22
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = sdiv i32 %22, 4
  %36 = mul i32 %35, 4
  %37 = sub i32 %22, %36
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %44

39:                                               ; preds = %30
  %40 = mul nsw i32 %24, %4
  %41 = add nsw i32 %40, %19
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %34, i64 %42
  store float 0.000000e+00, float addrspace(1)* %43, align 4, !tbaa !5
  br label %177

44:                                               ; preds = %30
  %45 = mul nsw i32 %35, 3
  %46 = icmp sgt i32 %37, 0
  %47 = sext i1 %46 to i32
  %48 = add nsw i32 %45, %37
  %49 = add nsw i32 %48, %47
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %5, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = icmp eq i32 %37, 2
  br i1 %53, label %54, label %57

54:                                               ; preds = %44
  %55 = sub nsw i32 0, %4
  %56 = sitofp i32 %55 to float
  br label %64

57:                                               ; preds = %44
  %58 = icmp sgt i32 %37, 2
  %59 = sext i1 %58 to i32
  %60 = add nsw i32 %48, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %6, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %64

64:                                               ; preds = %57, %54
  %65 = phi contract float [ %56, %54 ], [ %63, %57 ]
  %66 = icmp eq i32 %37, 3
  br i1 %66, label %67, label %69

67:                                               ; preds = %64
  %68 = sitofp i32 %4 to float
  br label %73

69:                                               ; preds = %64
  %70 = sext i32 %48 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %7, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %73

73:                                               ; preds = %69, %67
  %74 = phi contract float [ %68, %67 ], [ %72, %69 ]
  %75 = fadd contract float %52, -1.000000e+00
  %76 = tail call float @llvm.ceil.f32(float %75)
  %77 = fptosi float %76 to i32
  %78 = fadd contract float %65, -1.000000e+00
  %79 = tail call float @llvm.ceil.f32(float %78)
  %80 = fptosi float %79 to i32
  %81 = sitofp i32 %80 to float
  %82 = fsub contract float %81, %65
  %83 = fadd contract float %82, 1.000000e+00
  %84 = tail call float @llvm.floor.f32(float %74)
  %85 = fptosi float %84 to i32
  %86 = sitofp i32 %85 to float
  %87 = fsub contract float %74, %86
  %88 = add nsw i32 %20, %80
  %89 = icmp slt i32 %88, 1
  %90 = add i32 %24, %77
  %91 = add i32 %90, 1
  %92 = icmp ugt i32 %90, 2147483646
  %93 = select i1 %89, i1 true, i1 %92
  br i1 %93, label %107, label %94

94:                                               ; preds = %73
  %95 = add nsw i32 %3, -1
  %96 = tail call i32 @llvm.smin.i32(i32 %95, i32 %90)
  %97 = tail call i32 @llvm.smax.i32(i32 %96, i32 0)
  %98 = mul nsw i32 %97, %9
  %99 = add nsw i32 %4, -1
  %100 = add i32 %19, %80
  %101 = tail call i32 @llvm.smin.i32(i32 %99, i32 %100)
  %102 = tail call i32 @llvm.smax.i32(i32 %101, i32 0)
  %103 = add nsw i32 %102, %98
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %8, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %107

107:                                              ; preds = %73, %94
  %108 = phi contract float [ %106, %94 ], [ 0.000000e+00, %73 ]
  %109 = add nsw i32 %20, %85
  %110 = icmp sge i32 %109, %4
  %111 = select i1 %110, i1 true, i1 %92
  br i1 %111, label %124, label %112

112:                                              ; preds = %107
  %113 = add nsw i32 %3, -1
  %114 = tail call i32 @llvm.smin.i32(i32 %113, i32 %90)
  %115 = tail call i32 @llvm.smax.i32(i32 %114, i32 0)
  %116 = mul nsw i32 %115, %9
  %117 = add nsw i32 %4, -1
  %118 = tail call i32 @llvm.smin.i32(i32 %117, i32 %109)
  %119 = tail call i32 @llvm.smax.i32(i32 %118, i32 0)
  %120 = add nsw i32 %119, %116
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %8, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %124

124:                                              ; preds = %107, %112
  %125 = phi contract float [ %123, %112 ], [ 0.000000e+00, %107 ]
  %126 = icmp slt i32 %109, 1
  %127 = select contract i1 %126, float 1.000000e+00, float %87
  %128 = fmul contract float %127, %125
  %129 = fadd contract float %128, 0.000000e+00
  %130 = icmp slt i32 %88, %4
  %131 = select contract i1 %130, float %83, float 1.000000e+00
  %132 = fmul contract float %131, %108
  %133 = fadd contract float %132, %129
  %134 = tail call i32 @llvm.smin.i32(i32 %91, i32 %3)
  %135 = tail call i32 @llvm.smax.i32(i32 %134, i32 0)
  %136 = add nuw nsw i32 %4, 1
  %137 = mul nsw i32 %135, %136
  %138 = tail call i32 @llvm.smin.i32(i32 %109, i32 %4)
  %139 = tail call i32 @llvm.smax.i32(i32 %138, i32 0)
  %140 = add nsw i32 %139, %137
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5, !amdgpu.noclobber !9
  %144 = fadd contract float %143, %133
  %145 = tail call i32 @llvm.smin.i32(i32 %90, i32 %3)
  %146 = tail call i32 @llvm.smax.i32(i32 %145, i32 0)
  %147 = mul nsw i32 %146, %136
  %148 = add nsw i32 %139, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !5, !amdgpu.noclobber !9
  %152 = fsub contract float %144, %151
  %153 = tail call i32 @llvm.smin.i32(i32 %88, i32 %4)
  %154 = tail call i32 @llvm.smax.i32(i32 %153, i32 0)
  %155 = add nsw i32 %154, %137
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !5, !amdgpu.noclobber !9
  %159 = fsub contract float %152, %158
  %160 = add nsw i32 %154, %147
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !5, !amdgpu.noclobber !9
  %164 = fadd contract float %163, %159
  %165 = icmp ult i32 %90, 2147483647
  %166 = icmp slt i32 %91, %3
  %167 = uitofp i1 %166 to float
  %168 = select i1 %165, float %167, float 0.000000e+00
  %169 = fneg contract float %164
  %170 = fmul contract float %168, %169
  %171 = mul nsw i32 %24, %4
  %172 = add nsw i32 %171, %19
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %34, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !5, !amdgpu.noclobber !9
  %176 = fmul contract float %175, %170
  store float %176, float addrspace(1)* %174, align 4, !tbaa !5
  br label %177

177:                                              ; preds = %39, %124, %10
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
