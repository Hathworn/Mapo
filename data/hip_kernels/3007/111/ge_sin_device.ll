; ModuleID = '../data/hip_kernels/3007/111/main.cu'
source_filename = "../data/hip_kernels/3007/111/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6ge_siniiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %0
  %27 = icmp slt i32 %25, %1
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %183

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fcmp olt float %36, 1.310720e+05
  br i1 %37, label %38, label %46

38:                                               ; preds = %29
  %39 = fmul float %36, 0x3FE45F3060000000
  %40 = tail call float @llvm.rint.f32(float %39)
  %41 = tail call float @llvm.fma.f32(float %40, float 0xBFF921FB40000000, float %36)
  %42 = tail call float @llvm.fma.f32(float %40, float 0xBE74442D00000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %40, float 0xBCF8469880000000, float %42)
  %44 = fptosi float %40 to i32
  %45 = bitcast float %36 to i32
  br label %152

46:                                               ; preds = %29
  %47 = bitcast float %36 to i32
  %48 = lshr i32 %47, 23
  %49 = and i32 %47, 8388607
  %50 = or i32 %49, 8388608
  %51 = zext i32 %50 to i64
  %52 = mul nuw nsw i64 %51, 4266746795
  %53 = trunc i64 %52 to i32
  %54 = lshr i64 %52, 32
  %55 = mul nuw nsw i64 %51, 1011060801
  %56 = add nuw nsw i64 %54, %55
  %57 = trunc i64 %56 to i32
  %58 = lshr i64 %56, 32
  %59 = mul nuw nsw i64 %51, 3680671129
  %60 = add nuw nsw i64 %58, %59
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = mul nuw nsw i64 %51, 4113882560
  %64 = add nuw nsw i64 %62, %63
  %65 = trunc i64 %64 to i32
  %66 = lshr i64 %64, 32
  %67 = mul nuw nsw i64 %51, 4230436817
  %68 = add nuw nsw i64 %66, %67
  %69 = trunc i64 %68 to i32
  %70 = lshr i64 %68, 32
  %71 = mul nuw nsw i64 %51, 1313084713
  %72 = add nuw nsw i64 %70, %71
  %73 = trunc i64 %72 to i32
  %74 = lshr i64 %72, 32
  %75 = mul nuw nsw i64 %51, 2734261102
  %76 = add nuw nsw i64 %74, %75
  %77 = trunc i64 %76 to i32
  %78 = lshr i64 %76, 32
  %79 = trunc i64 %78 to i32
  %80 = add nsw i32 %48, -120
  %81 = icmp ugt i32 %80, 63
  %82 = select i1 %81, i32 %73, i32 %79
  %83 = select i1 %81, i32 %69, i32 %77
  %84 = select i1 %81, i32 %65, i32 %73
  %85 = select i1 %81, i32 %61, i32 %69
  %86 = select i1 %81, i32 %57, i32 %65
  %87 = select i1 %81, i32 %53, i32 %61
  %88 = select i1 %81, i32 -64, i32 0
  %89 = add nsw i32 %88, %80
  %90 = icmp ugt i32 %89, 31
  %91 = select i1 %90, i32 %83, i32 %82
  %92 = select i1 %90, i32 %84, i32 %83
  %93 = select i1 %90, i32 %85, i32 %84
  %94 = select i1 %90, i32 %86, i32 %85
  %95 = select i1 %90, i32 %87, i32 %86
  %96 = select i1 %90, i32 -32, i32 0
  %97 = add nsw i32 %96, %89
  %98 = icmp ugt i32 %97, 31
  %99 = select i1 %98, i32 %92, i32 %91
  %100 = select i1 %98, i32 %93, i32 %92
  %101 = select i1 %98, i32 %94, i32 %93
  %102 = select i1 %98, i32 %95, i32 %94
  %103 = select i1 %98, i32 -32, i32 0
  %104 = add nsw i32 %103, %97
  %105 = icmp eq i32 %104, 0
  %106 = sub nsw i32 32, %104
  %107 = tail call i32 @llvm.fshr.i32(i32 %99, i32 %100, i32 %106)
  %108 = tail call i32 @llvm.fshr.i32(i32 %100, i32 %101, i32 %106)
  %109 = tail call i32 @llvm.fshr.i32(i32 %101, i32 %102, i32 %106)
  %110 = select i1 %105, i32 %99, i32 %107
  %111 = select i1 %105, i32 %100, i32 %108
  %112 = select i1 %105, i32 %101, i32 %109
  %113 = lshr i32 %110, 29
  %114 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %111, i32 2)
  %115 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %112, i32 2)
  %116 = tail call i32 @llvm.fshl.i32(i32 %112, i32 %102, i32 2)
  %117 = and i32 %113, 1
  %118 = sub nsw i32 0, %117
  %119 = shl i32 %113, 31
  %120 = xor i32 %114, %118
  %121 = xor i32 %115, %118
  %122 = xor i32 %116, %118
  %123 = tail call i32 @llvm.ctlz.i32(i32 %120, i1 false), !range !11
  %124 = sub nsw i32 31, %123
  %125 = tail call i32 @llvm.fshr.i32(i32 %120, i32 %121, i32 %124)
  %126 = tail call i32 @llvm.fshr.i32(i32 %121, i32 %122, i32 %124)
  %127 = shl nuw nsw i32 %123, 23
  %128 = sub nuw nsw i32 1056964608, %127
  %129 = lshr i32 %125, 9
  %130 = or i32 %129, %128
  %131 = or i32 %130, %119
  %132 = bitcast i32 %131 to float
  %133 = tail call i32 @llvm.fshl.i32(i32 %125, i32 %126, i32 23)
  %134 = tail call i32 @llvm.ctlz.i32(i32 %133, i1 false), !range !11
  %135 = fmul float %132, 0x3FF921FB40000000
  %136 = add nuw nsw i32 %134, %123
  %137 = shl nuw nsw i32 %136, 23
  %138 = sub nuw nsw i32 855638016, %137
  %139 = sub nsw i32 31, %134
  %140 = tail call i32 @llvm.fshr.i32(i32 %133, i32 %126, i32 %139)
  %141 = lshr i32 %140, 9
  %142 = or i32 %138, %141
  %143 = or i32 %142, %119
  %144 = bitcast i32 %143 to float
  %145 = fneg float %135
  %146 = tail call float @llvm.fma.f32(float %132, float 0x3FF921FB40000000, float %145)
  %147 = tail call float @llvm.fma.f32(float %132, float 0x3E74442D00000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %144, float 0x3FF921FB40000000, float %147)
  %149 = fadd float %135, %148
  %150 = lshr i32 %110, 30
  %151 = add nuw nsw i32 %117, %150
  br label %152

152:                                              ; preds = %38, %46
  %153 = phi i32 [ %45, %38 ], [ %47, %46 ]
  %154 = phi float [ %43, %38 ], [ %149, %46 ]
  %155 = phi i32 [ %44, %38 ], [ %151, %46 ]
  %156 = fmul float %154, %154
  %157 = tail call float @llvm.fmuladd.f32(float %156, float 0xBF29833040000000, float 0x3F81103880000000)
  %158 = tail call float @llvm.fmuladd.f32(float %156, float %157, float 0xBFC55553A0000000)
  %159 = fmul float %156, %158
  %160 = tail call float @llvm.fmuladd.f32(float %154, float %159, float %154)
  %161 = tail call float @llvm.fmuladd.f32(float %156, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %162 = tail call float @llvm.fmuladd.f32(float %156, float %161, float 0x3FA5557EE0000000)
  %163 = tail call float @llvm.fmuladd.f32(float %156, float %162, float 0xBFE0000080000000)
  %164 = tail call float @llvm.fmuladd.f32(float %156, float %163, float 1.000000e+00)
  %165 = and i32 %155, 1
  %166 = icmp eq i32 %165, 0
  %167 = select i1 %166, float %160, float %164
  %168 = bitcast float %167 to i32
  %169 = shl i32 %155, 30
  %170 = and i32 %169, -2147483648
  %171 = bitcast float %35 to i32
  %172 = xor i32 %153, %171
  %173 = xor i32 %172, %170
  %174 = xor i32 %173, %168
  %175 = bitcast i32 %174 to float
  %176 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 504)
  %177 = select i1 %176, float %175, float 0x7FF8000000000000
  %178 = add nsw i32 %17, %6
  %179 = mul nsw i32 %25, %7
  %180 = add nsw i32 %178, %179
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %5, i64 %181
  store float %177, float addrspace(1)* %182, align 4, !tbaa !7
  br label %183

183:                                              ; preds = %152, %8
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
