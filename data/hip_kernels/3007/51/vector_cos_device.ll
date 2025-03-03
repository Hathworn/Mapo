; ModuleID = '../data/hip_kernels/3007/51/main.cu'
source_filename = "../data/hip_kernels/3007/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10vector_cosiPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %166

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fcmp olt float %24, 1.310720e+05
  br i1 %25, label %26, label %33

26:                                               ; preds = %18
  %27 = fmul float %24, 0x3FE45F3060000000
  %28 = tail call float @llvm.rint.f32(float %27)
  %29 = tail call float @llvm.fma.f32(float %28, float 0xBFF921FB40000000, float %24)
  %30 = tail call float @llvm.fma.f32(float %28, float 0xBE74442D00000000, float %29)
  %31 = tail call float @llvm.fma.f32(float %28, float 0xBCF8469880000000, float %30)
  %32 = fptosi float %28 to i32
  br label %139

33:                                               ; preds = %18
  %34 = bitcast float %24 to i32
  %35 = lshr i32 %34, 23
  %36 = and i32 %34, 8388607
  %37 = or i32 %36, 8388608
  %38 = zext i32 %37 to i64
  %39 = mul nuw nsw i64 %38, 4266746795
  %40 = trunc i64 %39 to i32
  %41 = lshr i64 %39, 32
  %42 = mul nuw nsw i64 %38, 1011060801
  %43 = add nuw nsw i64 %41, %42
  %44 = trunc i64 %43 to i32
  %45 = lshr i64 %43, 32
  %46 = mul nuw nsw i64 %38, 3680671129
  %47 = add nuw nsw i64 %45, %46
  %48 = trunc i64 %47 to i32
  %49 = lshr i64 %47, 32
  %50 = mul nuw nsw i64 %38, 4113882560
  %51 = add nuw nsw i64 %49, %50
  %52 = trunc i64 %51 to i32
  %53 = lshr i64 %51, 32
  %54 = mul nuw nsw i64 %38, 4230436817
  %55 = add nuw nsw i64 %53, %54
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %55, 32
  %58 = mul nuw nsw i64 %38, 1313084713
  %59 = add nuw nsw i64 %57, %58
  %60 = trunc i64 %59 to i32
  %61 = lshr i64 %59, 32
  %62 = mul nuw nsw i64 %38, 2734261102
  %63 = add nuw nsw i64 %61, %62
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %63, 32
  %66 = trunc i64 %65 to i32
  %67 = add nsw i32 %35, -120
  %68 = icmp ugt i32 %67, 63
  %69 = select i1 %68, i32 %60, i32 %66
  %70 = select i1 %68, i32 %56, i32 %64
  %71 = select i1 %68, i32 %52, i32 %60
  %72 = select i1 %68, i32 %48, i32 %56
  %73 = select i1 %68, i32 %44, i32 %52
  %74 = select i1 %68, i32 %40, i32 %48
  %75 = select i1 %68, i32 -64, i32 0
  %76 = add nsw i32 %75, %67
  %77 = icmp ugt i32 %76, 31
  %78 = select i1 %77, i32 %70, i32 %69
  %79 = select i1 %77, i32 %71, i32 %70
  %80 = select i1 %77, i32 %72, i32 %71
  %81 = select i1 %77, i32 %73, i32 %72
  %82 = select i1 %77, i32 %74, i32 %73
  %83 = select i1 %77, i32 -32, i32 0
  %84 = add nsw i32 %83, %76
  %85 = icmp ugt i32 %84, 31
  %86 = select i1 %85, i32 %79, i32 %78
  %87 = select i1 %85, i32 %80, i32 %79
  %88 = select i1 %85, i32 %81, i32 %80
  %89 = select i1 %85, i32 %82, i32 %81
  %90 = select i1 %85, i32 -32, i32 0
  %91 = add nsw i32 %90, %84
  %92 = icmp eq i32 %91, 0
  %93 = sub nsw i32 32, %91
  %94 = tail call i32 @llvm.fshr.i32(i32 %86, i32 %87, i32 %93)
  %95 = tail call i32 @llvm.fshr.i32(i32 %87, i32 %88, i32 %93)
  %96 = tail call i32 @llvm.fshr.i32(i32 %88, i32 %89, i32 %93)
  %97 = select i1 %92, i32 %86, i32 %94
  %98 = select i1 %92, i32 %87, i32 %95
  %99 = select i1 %92, i32 %88, i32 %96
  %100 = lshr i32 %97, 29
  %101 = tail call i32 @llvm.fshl.i32(i32 %97, i32 %98, i32 2)
  %102 = tail call i32 @llvm.fshl.i32(i32 %98, i32 %99, i32 2)
  %103 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %89, i32 2)
  %104 = and i32 %100, 1
  %105 = sub nsw i32 0, %104
  %106 = shl i32 %100, 31
  %107 = xor i32 %101, %105
  %108 = xor i32 %102, %105
  %109 = xor i32 %103, %105
  %110 = tail call i32 @llvm.ctlz.i32(i32 %107, i1 false), !range !11
  %111 = sub nsw i32 31, %110
  %112 = tail call i32 @llvm.fshr.i32(i32 %107, i32 %108, i32 %111)
  %113 = tail call i32 @llvm.fshr.i32(i32 %108, i32 %109, i32 %111)
  %114 = shl nuw nsw i32 %110, 23
  %115 = sub nuw nsw i32 1056964608, %114
  %116 = lshr i32 %112, 9
  %117 = or i32 %116, %115
  %118 = or i32 %117, %106
  %119 = bitcast i32 %118 to float
  %120 = tail call i32 @llvm.fshl.i32(i32 %112, i32 %113, i32 23)
  %121 = tail call i32 @llvm.ctlz.i32(i32 %120, i1 false), !range !11
  %122 = fmul float %119, 0x3FF921FB40000000
  %123 = add nuw nsw i32 %121, %110
  %124 = shl nuw nsw i32 %123, 23
  %125 = sub nuw nsw i32 855638016, %124
  %126 = sub nsw i32 31, %121
  %127 = tail call i32 @llvm.fshr.i32(i32 %120, i32 %113, i32 %126)
  %128 = lshr i32 %127, 9
  %129 = or i32 %125, %128
  %130 = or i32 %129, %106
  %131 = bitcast i32 %130 to float
  %132 = fneg float %122
  %133 = tail call float @llvm.fma.f32(float %119, float 0x3FF921FB40000000, float %132)
  %134 = tail call float @llvm.fma.f32(float %119, float 0x3E74442D00000000, float %133)
  %135 = tail call float @llvm.fma.f32(float %131, float 0x3FF921FB40000000, float %134)
  %136 = fadd float %122, %135
  %137 = lshr i32 %97, 30
  %138 = add nuw nsw i32 %104, %137
  br label %139

139:                                              ; preds = %26, %33
  %140 = phi float [ %31, %26 ], [ %136, %33 ]
  %141 = phi i32 [ %32, %26 ], [ %138, %33 ]
  %142 = fmul float %140, %140
  %143 = tail call float @llvm.fmuladd.f32(float %142, float 0xBF29833040000000, float 0x3F81103880000000)
  %144 = tail call float @llvm.fmuladd.f32(float %142, float %143, float 0xBFC55553A0000000)
  %145 = fmul float %142, %144
  %146 = tail call float @llvm.fmuladd.f32(float %140, float %145, float %140)
  %147 = tail call float @llvm.fmuladd.f32(float %142, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %148 = tail call float @llvm.fmuladd.f32(float %142, float %147, float 0x3FA5557EE0000000)
  %149 = tail call float @llvm.fmuladd.f32(float %142, float %148, float 0xBFE0000080000000)
  %150 = tail call float @llvm.fmuladd.f32(float %142, float %149, float 1.000000e+00)
  %151 = fneg float %146
  %152 = and i32 %141, 1
  %153 = icmp eq i32 %152, 0
  %154 = select i1 %153, float %150, float %151
  %155 = bitcast float %154 to i32
  %156 = shl i32 %141, 30
  %157 = and i32 %156, -2147483648
  %158 = xor i32 %157, %155
  %159 = bitcast i32 %158 to float
  %160 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 504)
  %161 = select i1 %160, float %159, float 0x7FF8000000000000
  %162 = mul nsw i32 %16, %6
  %163 = add nsw i32 %162, %5
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %4, i64 %164
  store float %161, float addrspace(1)* %165, align 4, !tbaa !7
  br label %166

166:                                              ; preds = %139, %7
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i32 0, i32 33}
