; ModuleID = '../data/hip_kernels/3007/52/main.cu'
source_filename = "../data/hip_kernels/3007/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10vector_taniPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %174

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fcmp olt float %24, 1.310720e+05
  br i1 %25, label %26, label %34

26:                                               ; preds = %18
  %27 = fmul float %24, 0x3FE45F3060000000
  %28 = tail call float @llvm.rint.f32(float %27)
  %29 = tail call float @llvm.fma.f32(float %28, float 0xBFF921FB40000000, float %24)
  %30 = tail call float @llvm.fma.f32(float %28, float 0xBE74442D00000000, float %29)
  %31 = tail call float @llvm.fma.f32(float %28, float 0xBCF8469880000000, float %30)
  %32 = fptosi float %28 to i32
  %33 = bitcast float %24 to i32
  br label %140

34:                                               ; preds = %18
  %35 = bitcast float %24 to i32
  %36 = lshr i32 %35, 23
  %37 = and i32 %35, 8388607
  %38 = or i32 %37, 8388608
  %39 = zext i32 %38 to i64
  %40 = mul nuw nsw i64 %39, 4266746795
  %41 = trunc i64 %40 to i32
  %42 = lshr i64 %40, 32
  %43 = mul nuw nsw i64 %39, 1011060801
  %44 = add nuw nsw i64 %42, %43
  %45 = trunc i64 %44 to i32
  %46 = lshr i64 %44, 32
  %47 = mul nuw nsw i64 %39, 3680671129
  %48 = add nuw nsw i64 %46, %47
  %49 = trunc i64 %48 to i32
  %50 = lshr i64 %48, 32
  %51 = mul nuw nsw i64 %39, 4113882560
  %52 = add nuw nsw i64 %50, %51
  %53 = trunc i64 %52 to i32
  %54 = lshr i64 %52, 32
  %55 = mul nuw nsw i64 %39, 4230436817
  %56 = add nuw nsw i64 %54, %55
  %57 = trunc i64 %56 to i32
  %58 = lshr i64 %56, 32
  %59 = mul nuw nsw i64 %39, 1313084713
  %60 = add nuw nsw i64 %58, %59
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = mul nuw nsw i64 %39, 2734261102
  %64 = add nuw nsw i64 %62, %63
  %65 = trunc i64 %64 to i32
  %66 = lshr i64 %64, 32
  %67 = trunc i64 %66 to i32
  %68 = add nsw i32 %36, -120
  %69 = icmp ugt i32 %68, 63
  %70 = select i1 %69, i32 %61, i32 %67
  %71 = select i1 %69, i32 %57, i32 %65
  %72 = select i1 %69, i32 %53, i32 %61
  %73 = select i1 %69, i32 %49, i32 %57
  %74 = select i1 %69, i32 %45, i32 %53
  %75 = select i1 %69, i32 %41, i32 %49
  %76 = select i1 %69, i32 -64, i32 0
  %77 = add nsw i32 %76, %68
  %78 = icmp ugt i32 %77, 31
  %79 = select i1 %78, i32 %71, i32 %70
  %80 = select i1 %78, i32 %72, i32 %71
  %81 = select i1 %78, i32 %73, i32 %72
  %82 = select i1 %78, i32 %74, i32 %73
  %83 = select i1 %78, i32 %75, i32 %74
  %84 = select i1 %78, i32 -32, i32 0
  %85 = add nsw i32 %84, %77
  %86 = icmp ugt i32 %85, 31
  %87 = select i1 %86, i32 %80, i32 %79
  %88 = select i1 %86, i32 %81, i32 %80
  %89 = select i1 %86, i32 %82, i32 %81
  %90 = select i1 %86, i32 %83, i32 %82
  %91 = select i1 %86, i32 -32, i32 0
  %92 = add nsw i32 %91, %85
  %93 = icmp eq i32 %92, 0
  %94 = sub nsw i32 32, %92
  %95 = tail call i32 @llvm.fshr.i32(i32 %87, i32 %88, i32 %94)
  %96 = tail call i32 @llvm.fshr.i32(i32 %88, i32 %89, i32 %94)
  %97 = tail call i32 @llvm.fshr.i32(i32 %89, i32 %90, i32 %94)
  %98 = select i1 %93, i32 %87, i32 %95
  %99 = select i1 %93, i32 %88, i32 %96
  %100 = select i1 %93, i32 %89, i32 %97
  %101 = lshr i32 %98, 29
  %102 = tail call i32 @llvm.fshl.i32(i32 %98, i32 %99, i32 2)
  %103 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %100, i32 2)
  %104 = tail call i32 @llvm.fshl.i32(i32 %100, i32 %90, i32 2)
  %105 = and i32 %101, 1
  %106 = sub nsw i32 0, %105
  %107 = shl i32 %101, 31
  %108 = xor i32 %102, %106
  %109 = xor i32 %103, %106
  %110 = xor i32 %104, %106
  %111 = tail call i32 @llvm.ctlz.i32(i32 %108, i1 false), !range !11
  %112 = sub nsw i32 31, %111
  %113 = tail call i32 @llvm.fshr.i32(i32 %108, i32 %109, i32 %112)
  %114 = tail call i32 @llvm.fshr.i32(i32 %109, i32 %110, i32 %112)
  %115 = shl nuw nsw i32 %111, 23
  %116 = sub nuw nsw i32 1056964608, %115
  %117 = lshr i32 %113, 9
  %118 = or i32 %117, %116
  %119 = or i32 %118, %107
  %120 = bitcast i32 %119 to float
  %121 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %114, i32 23)
  %122 = tail call i32 @llvm.ctlz.i32(i32 %121, i1 false), !range !11
  %123 = fmul float %120, 0x3FF921FB40000000
  %124 = add nuw nsw i32 %122, %111
  %125 = shl nuw nsw i32 %124, 23
  %126 = sub nuw nsw i32 855638016, %125
  %127 = sub nsw i32 31, %122
  %128 = tail call i32 @llvm.fshr.i32(i32 %121, i32 %114, i32 %127)
  %129 = lshr i32 %128, 9
  %130 = or i32 %126, %129
  %131 = or i32 %130, %107
  %132 = bitcast i32 %131 to float
  %133 = fneg float %123
  %134 = tail call float @llvm.fma.f32(float %120, float 0x3FF921FB40000000, float %133)
  %135 = tail call float @llvm.fma.f32(float %120, float 0x3E74442D00000000, float %134)
  %136 = tail call float @llvm.fma.f32(float %132, float 0x3FF921FB40000000, float %135)
  %137 = fadd float %123, %136
  %138 = lshr i32 %98, 30
  %139 = add nuw nsw i32 %105, %138
  br label %140

140:                                              ; preds = %26, %34
  %141 = phi i32 [ %33, %26 ], [ %35, %34 ]
  %142 = phi float [ %31, %26 ], [ %137, %34 ]
  %143 = phi i32 [ %32, %26 ], [ %139, %34 ]
  %144 = and i32 %143, 1
  %145 = fmul float %142, %142
  %146 = tail call float @llvm.fmuladd.f32(float %145, float 0xBF919DBA60000000, float 0x3FD8A8B0E0000000)
  %147 = tail call float @llvm.fmuladd.f32(float %145, float 0x3F92E29000000000, float 0xBFE07266E0000000)
  %148 = tail call float @llvm.fmuladd.f32(float %145, float %147, float 0x3FF27E84A0000000)
  %149 = tail call float @llvm.amdgcn.rcp.f32(float %148)
  %150 = fmul float %146, %149
  %151 = fmul float %145, %150
  %152 = tail call float @llvm.fma.f32(float %151, float %142, float %142)
  %153 = fsub float %152, %142
  %154 = fneg float %153
  %155 = tail call float @llvm.fma.f32(float %151, float %142, float %154)
  %156 = tail call float @llvm.amdgcn.rcp.f32(float %152)
  %157 = fneg float %156
  %158 = tail call float @llvm.fma.f32(float %152, float %157, float 1.000000e+00)
  %159 = tail call float @llvm.fma.f32(float %155, float %157, float %158)
  %160 = tail call float @llvm.fma.f32(float %159, float %157, float %157)
  %161 = icmp eq i32 %144, 0
  %162 = select i1 %161, float %152, float %160
  %163 = bitcast float %162 to i32
  %164 = bitcast float %23 to i32
  %165 = xor i32 %141, %164
  %166 = xor i32 %165, %163
  %167 = bitcast i32 %166 to float
  %168 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 504)
  %169 = select i1 %168, float %167, float 0x7FF8000000000000
  %170 = mul nsw i32 %16, %6
  %171 = add nsw i32 %170, %5
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %4, i64 %172
  store float %169, float addrspace(1)* %173, align 4, !tbaa !7
  br label %174

174:                                              ; preds = %140, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

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
