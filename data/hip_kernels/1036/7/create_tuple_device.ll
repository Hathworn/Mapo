; ModuleID = '../data/hip_kernels/1036/7/main.cu'
source_filename = "../data/hip_kernels/1036/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12create_tuplePdPiS0_S_i(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp slt i32 %6, %4
  br i1 %7, label %8, label %157

8:                                                ; preds = %5
  %9 = zext i32 %6 to i64
  %10 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %9
  store i32 %6, i32 addrspace(1)* %10, align 4, !tbaa !5
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %9
  store i32 %6, i32 addrspace(1)* %11, align 4, !tbaa !5
  %12 = getelementptr inbounds double, double addrspace(1)* %0, i64 %9
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !9, !amdgpu.noclobber !11
  %14 = fmul contract double %13, 2.000000e+00
  %15 = fptrunc double %14 to float
  %16 = tail call float @llvm.fabs.f32(float %15)
  %17 = fcmp olt float %16, 1.310720e+05
  br i1 %17, label %18, label %25

18:                                               ; preds = %8
  %19 = fmul float %16, 0x3FE45F3060000000
  %20 = tail call float @llvm.rint.f32(float %19)
  %21 = tail call float @llvm.fma.f32(float %20, float 0xBFF921FB40000000, float %16)
  %22 = tail call float @llvm.fma.f32(float %20, float 0xBE74442D00000000, float %21)
  %23 = tail call float @llvm.fma.f32(float %20, float 0xBCF8469880000000, float %22)
  %24 = fptosi float %20 to i32
  br label %131

25:                                               ; preds = %8
  %26 = bitcast float %16 to i32
  %27 = lshr i32 %26, 23
  %28 = and i32 %26, 8388607
  %29 = or i32 %28, 8388608
  %30 = zext i32 %29 to i64
  %31 = mul nuw nsw i64 %30, 4266746795
  %32 = trunc i64 %31 to i32
  %33 = lshr i64 %31, 32
  %34 = mul nuw nsw i64 %30, 1011060801
  %35 = add nuw nsw i64 %33, %34
  %36 = trunc i64 %35 to i32
  %37 = lshr i64 %35, 32
  %38 = mul nuw nsw i64 %30, 3680671129
  %39 = add nuw nsw i64 %37, %38
  %40 = trunc i64 %39 to i32
  %41 = lshr i64 %39, 32
  %42 = mul nuw nsw i64 %30, 4113882560
  %43 = add nuw nsw i64 %41, %42
  %44 = trunc i64 %43 to i32
  %45 = lshr i64 %43, 32
  %46 = mul nuw nsw i64 %30, 4230436817
  %47 = add nuw nsw i64 %45, %46
  %48 = trunc i64 %47 to i32
  %49 = lshr i64 %47, 32
  %50 = mul nuw nsw i64 %30, 1313084713
  %51 = add nuw nsw i64 %49, %50
  %52 = trunc i64 %51 to i32
  %53 = lshr i64 %51, 32
  %54 = mul nuw nsw i64 %30, 2734261102
  %55 = add nuw nsw i64 %53, %54
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %55, 32
  %58 = trunc i64 %57 to i32
  %59 = add nsw i32 %27, -120
  %60 = icmp ugt i32 %59, 63
  %61 = select i1 %60, i32 %52, i32 %58
  %62 = select i1 %60, i32 %48, i32 %56
  %63 = select i1 %60, i32 %44, i32 %52
  %64 = select i1 %60, i32 %40, i32 %48
  %65 = select i1 %60, i32 %36, i32 %44
  %66 = select i1 %60, i32 %32, i32 %40
  %67 = select i1 %60, i32 -64, i32 0
  %68 = add nsw i32 %67, %59
  %69 = icmp ugt i32 %68, 31
  %70 = select i1 %69, i32 %62, i32 %61
  %71 = select i1 %69, i32 %63, i32 %62
  %72 = select i1 %69, i32 %64, i32 %63
  %73 = select i1 %69, i32 %65, i32 %64
  %74 = select i1 %69, i32 %66, i32 %65
  %75 = select i1 %69, i32 -32, i32 0
  %76 = add nsw i32 %75, %68
  %77 = icmp ugt i32 %76, 31
  %78 = select i1 %77, i32 %71, i32 %70
  %79 = select i1 %77, i32 %72, i32 %71
  %80 = select i1 %77, i32 %73, i32 %72
  %81 = select i1 %77, i32 %74, i32 %73
  %82 = select i1 %77, i32 -32, i32 0
  %83 = add nsw i32 %82, %76
  %84 = icmp eq i32 %83, 0
  %85 = sub nsw i32 32, %83
  %86 = tail call i32 @llvm.fshr.i32(i32 %78, i32 %79, i32 %85)
  %87 = tail call i32 @llvm.fshr.i32(i32 %79, i32 %80, i32 %85)
  %88 = tail call i32 @llvm.fshr.i32(i32 %80, i32 %81, i32 %85)
  %89 = select i1 %84, i32 %78, i32 %86
  %90 = select i1 %84, i32 %79, i32 %87
  %91 = select i1 %84, i32 %80, i32 %88
  %92 = lshr i32 %89, 29
  %93 = tail call i32 @llvm.fshl.i32(i32 %89, i32 %90, i32 2)
  %94 = tail call i32 @llvm.fshl.i32(i32 %90, i32 %91, i32 2)
  %95 = tail call i32 @llvm.fshl.i32(i32 %91, i32 %81, i32 2)
  %96 = and i32 %92, 1
  %97 = sub nsw i32 0, %96
  %98 = shl i32 %92, 31
  %99 = xor i32 %93, %97
  %100 = xor i32 %94, %97
  %101 = xor i32 %95, %97
  %102 = tail call i32 @llvm.ctlz.i32(i32 %99, i1 false), !range !12
  %103 = sub nsw i32 31, %102
  %104 = tail call i32 @llvm.fshr.i32(i32 %99, i32 %100, i32 %103)
  %105 = tail call i32 @llvm.fshr.i32(i32 %100, i32 %101, i32 %103)
  %106 = shl nuw nsw i32 %102, 23
  %107 = sub nuw nsw i32 1056964608, %106
  %108 = lshr i32 %104, 9
  %109 = or i32 %108, %107
  %110 = or i32 %109, %98
  %111 = bitcast i32 %110 to float
  %112 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %105, i32 23)
  %113 = tail call i32 @llvm.ctlz.i32(i32 %112, i1 false), !range !12
  %114 = fmul float %111, 0x3FF921FB40000000
  %115 = add nuw nsw i32 %113, %102
  %116 = shl nuw nsw i32 %115, 23
  %117 = sub nuw nsw i32 855638016, %116
  %118 = sub nsw i32 31, %113
  %119 = tail call i32 @llvm.fshr.i32(i32 %112, i32 %105, i32 %118)
  %120 = lshr i32 %119, 9
  %121 = or i32 %117, %120
  %122 = or i32 %121, %98
  %123 = bitcast i32 %122 to float
  %124 = fneg float %114
  %125 = tail call float @llvm.fma.f32(float %111, float 0x3FF921FB40000000, float %124)
  %126 = tail call float @llvm.fma.f32(float %111, float 0x3E74442D00000000, float %125)
  %127 = tail call float @llvm.fma.f32(float %123, float 0x3FF921FB40000000, float %126)
  %128 = fadd float %114, %127
  %129 = lshr i32 %89, 30
  %130 = add nuw nsw i32 %96, %129
  br label %131

131:                                              ; preds = %18, %25
  %132 = phi float [ %23, %18 ], [ %128, %25 ]
  %133 = phi i32 [ %24, %18 ], [ %130, %25 ]
  %134 = fmul float %132, %132
  %135 = tail call float @llvm.fmuladd.f32(float %134, float 0xBF29833040000000, float 0x3F81103880000000)
  %136 = tail call float @llvm.fmuladd.f32(float %134, float %135, float 0xBFC55553A0000000)
  %137 = fmul float %134, %136
  %138 = tail call float @llvm.fmuladd.f32(float %132, float %137, float %132)
  %139 = tail call float @llvm.fmuladd.f32(float %134, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %140 = tail call float @llvm.fmuladd.f32(float %134, float %139, float 0x3FA5557EE0000000)
  %141 = tail call float @llvm.fmuladd.f32(float %134, float %140, float 0xBFE0000080000000)
  %142 = tail call float @llvm.fmuladd.f32(float %134, float %141, float 1.000000e+00)
  %143 = fneg float %138
  %144 = and i32 %133, 1
  %145 = icmp eq i32 %144, 0
  %146 = select i1 %145, float %142, float %143
  %147 = bitcast float %146 to i32
  %148 = shl i32 %133, 30
  %149 = and i32 %148, -2147483648
  %150 = xor i32 %149, %147
  %151 = bitcast i32 %150 to float
  %152 = tail call i1 @llvm.amdgcn.class.f32(float %16, i32 504)
  %153 = fmul contract float %151, 2.000000e+00
  %154 = fpext float %153 to double
  %155 = select i1 %152, double %154, double 0x7FF8000000000000
  %156 = getelementptr inbounds double, double addrspace(1)* %3, i64 %9
  store double %155, double addrspace(1)* %156, align 8, !tbaa !9
  br label %162

157:                                              ; preds = %5
  %158 = icmp eq i32 %6, %4
  br i1 %158, label %159, label %162

159:                                              ; preds = %157
  %160 = zext i32 %4 to i64
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %160
  store i32 %4, i32 addrspace(1)* %161, align 4, !tbaa !5
  br label %162

162:                                              ; preds = %157, %159, %131
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !7, i64 0}
!11 = !{}
!12 = !{i32 0, i32 33}
