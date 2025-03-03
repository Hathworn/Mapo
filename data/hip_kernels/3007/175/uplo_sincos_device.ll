; ModuleID = '../data/hip_kernels/3007/175/main.cu'
source_filename = "../data/hip_kernels/3007/175/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11uplo_sincosiiiPKfiiPfiiS1_ii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8, float addrspace(1)* nocapture writeonly %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %21, %0
  %31 = icmp slt i32 %29, %0
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %205

33:                                               ; preds = %12
  %34 = icmp eq i32 %1, 132
  %35 = mul nsw i32 %21, %2
  %36 = mul nsw i32 %29, %2
  %37 = icmp sgt i32 %35, %36
  %38 = icmp sge i32 %35, %36
  %39 = select i1 %34, i1 %37, i1 %38
  br i1 %39, label %40, label %205

40:                                               ; preds = %33
  %41 = add nsw i32 %21, %4
  %42 = mul nsw i32 %29, %5
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = add nsw i32 %21, %7
  %48 = mul nsw i32 %29, %8
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %6, i64 %50
  %52 = add nsw i32 %21, %10
  %53 = mul nsw i32 %29, %11
  %54 = add nsw i32 %52, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %9, i64 %55
  %57 = tail call float @llvm.fabs.f32(float %46)
  %58 = fcmp olt float %57, 1.310720e+05
  br i1 %58, label %59, label %67

59:                                               ; preds = %40
  %60 = fmul float %57, 0x3FE45F3060000000
  %61 = tail call float @llvm.rint.f32(float %60)
  %62 = tail call float @llvm.fma.f32(float %61, float 0xBFF921FB40000000, float %57)
  %63 = tail call float @llvm.fma.f32(float %61, float 0xBE74442D00000000, float %62)
  %64 = tail call float @llvm.fma.f32(float %61, float 0xBCF8469880000000, float %63)
  %65 = fptosi float %61 to i32
  %66 = bitcast float %57 to i32
  br label %173

67:                                               ; preds = %40
  %68 = bitcast float %57 to i32
  %69 = lshr i32 %68, 23
  %70 = and i32 %68, 8388607
  %71 = or i32 %70, 8388608
  %72 = zext i32 %71 to i64
  %73 = mul nuw nsw i64 %72, 4266746795
  %74 = trunc i64 %73 to i32
  %75 = lshr i64 %73, 32
  %76 = mul nuw nsw i64 %72, 1011060801
  %77 = add nuw nsw i64 %75, %76
  %78 = trunc i64 %77 to i32
  %79 = lshr i64 %77, 32
  %80 = mul nuw nsw i64 %72, 3680671129
  %81 = add nuw nsw i64 %79, %80
  %82 = trunc i64 %81 to i32
  %83 = lshr i64 %81, 32
  %84 = mul nuw nsw i64 %72, 4113882560
  %85 = add nuw nsw i64 %83, %84
  %86 = trunc i64 %85 to i32
  %87 = lshr i64 %85, 32
  %88 = mul nuw nsw i64 %72, 4230436817
  %89 = add nuw nsw i64 %87, %88
  %90 = trunc i64 %89 to i32
  %91 = lshr i64 %89, 32
  %92 = mul nuw nsw i64 %72, 1313084713
  %93 = add nuw nsw i64 %91, %92
  %94 = trunc i64 %93 to i32
  %95 = lshr i64 %93, 32
  %96 = mul nuw nsw i64 %72, 2734261102
  %97 = add nuw nsw i64 %95, %96
  %98 = trunc i64 %97 to i32
  %99 = lshr i64 %97, 32
  %100 = trunc i64 %99 to i32
  %101 = add nsw i32 %69, -120
  %102 = icmp ugt i32 %101, 63
  %103 = select i1 %102, i32 %94, i32 %100
  %104 = select i1 %102, i32 %90, i32 %98
  %105 = select i1 %102, i32 %86, i32 %94
  %106 = select i1 %102, i32 %82, i32 %90
  %107 = select i1 %102, i32 %78, i32 %86
  %108 = select i1 %102, i32 %74, i32 %82
  %109 = select i1 %102, i32 -64, i32 0
  %110 = add nsw i32 %109, %101
  %111 = icmp ugt i32 %110, 31
  %112 = select i1 %111, i32 %104, i32 %103
  %113 = select i1 %111, i32 %105, i32 %104
  %114 = select i1 %111, i32 %106, i32 %105
  %115 = select i1 %111, i32 %107, i32 %106
  %116 = select i1 %111, i32 %108, i32 %107
  %117 = select i1 %111, i32 -32, i32 0
  %118 = add nsw i32 %117, %110
  %119 = icmp ugt i32 %118, 31
  %120 = select i1 %119, i32 %113, i32 %112
  %121 = select i1 %119, i32 %114, i32 %113
  %122 = select i1 %119, i32 %115, i32 %114
  %123 = select i1 %119, i32 %116, i32 %115
  %124 = select i1 %119, i32 -32, i32 0
  %125 = add nsw i32 %124, %118
  %126 = icmp eq i32 %125, 0
  %127 = sub nsw i32 32, %125
  %128 = tail call i32 @llvm.fshr.i32(i32 %120, i32 %121, i32 %127)
  %129 = tail call i32 @llvm.fshr.i32(i32 %121, i32 %122, i32 %127)
  %130 = tail call i32 @llvm.fshr.i32(i32 %122, i32 %123, i32 %127)
  %131 = select i1 %126, i32 %120, i32 %128
  %132 = select i1 %126, i32 %121, i32 %129
  %133 = select i1 %126, i32 %122, i32 %130
  %134 = lshr i32 %131, 29
  %135 = tail call i32 @llvm.fshl.i32(i32 %131, i32 %132, i32 2)
  %136 = tail call i32 @llvm.fshl.i32(i32 %132, i32 %133, i32 2)
  %137 = tail call i32 @llvm.fshl.i32(i32 %133, i32 %123, i32 2)
  %138 = and i32 %134, 1
  %139 = sub nsw i32 0, %138
  %140 = shl i32 %134, 31
  %141 = xor i32 %135, %139
  %142 = xor i32 %136, %139
  %143 = xor i32 %137, %139
  %144 = tail call i32 @llvm.ctlz.i32(i32 %141, i1 false), !range !11
  %145 = sub nsw i32 31, %144
  %146 = tail call i32 @llvm.fshr.i32(i32 %141, i32 %142, i32 %145)
  %147 = tail call i32 @llvm.fshr.i32(i32 %142, i32 %143, i32 %145)
  %148 = shl nuw nsw i32 %144, 23
  %149 = sub nuw nsw i32 1056964608, %148
  %150 = lshr i32 %146, 9
  %151 = or i32 %150, %149
  %152 = or i32 %151, %140
  %153 = bitcast i32 %152 to float
  %154 = tail call i32 @llvm.fshl.i32(i32 %146, i32 %147, i32 23)
  %155 = tail call i32 @llvm.ctlz.i32(i32 %154, i1 false), !range !11
  %156 = fmul float %153, 0x3FF921FB40000000
  %157 = add nuw nsw i32 %155, %144
  %158 = shl nuw nsw i32 %157, 23
  %159 = sub nuw nsw i32 855638016, %158
  %160 = sub nsw i32 31, %155
  %161 = tail call i32 @llvm.fshr.i32(i32 %154, i32 %147, i32 %160)
  %162 = lshr i32 %161, 9
  %163 = or i32 %159, %162
  %164 = or i32 %163, %140
  %165 = bitcast i32 %164 to float
  %166 = fneg float %156
  %167 = tail call float @llvm.fma.f32(float %153, float 0x3FF921FB40000000, float %166)
  %168 = tail call float @llvm.fma.f32(float %153, float 0x3E74442D00000000, float %167)
  %169 = tail call float @llvm.fma.f32(float %165, float 0x3FF921FB40000000, float %168)
  %170 = fadd float %156, %169
  %171 = lshr i32 %131, 30
  %172 = add nuw nsw i32 %138, %171
  br label %173

173:                                              ; preds = %59, %67
  %174 = phi i32 [ %66, %59 ], [ %68, %67 ]
  %175 = phi float [ %64, %59 ], [ %170, %67 ]
  %176 = phi i32 [ %65, %59 ], [ %172, %67 ]
  %177 = fmul float %175, %175
  %178 = tail call float @llvm.fmuladd.f32(float %177, float 0xBF29833040000000, float 0x3F81103880000000)
  %179 = tail call float @llvm.fmuladd.f32(float %177, float %178, float 0xBFC55553A0000000)
  %180 = fmul float %177, %179
  %181 = tail call float @llvm.fmuladd.f32(float %175, float %180, float %175)
  %182 = tail call float @llvm.fmuladd.f32(float %177, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %183 = tail call float @llvm.fmuladd.f32(float %177, float %182, float 0x3FA5557EE0000000)
  %184 = tail call float @llvm.fmuladd.f32(float %177, float %183, float 0xBFE0000080000000)
  %185 = tail call float @llvm.fmuladd.f32(float %177, float %184, float 1.000000e+00)
  %186 = shl i32 %176, 30
  %187 = and i32 %186, -2147483648
  %188 = and i32 %176, 1
  %189 = icmp eq i32 %188, 0
  %190 = select i1 %189, float %181, float %185
  %191 = bitcast float %190 to i32
  %192 = bitcast float %46 to i32
  %193 = xor i32 %174, %192
  %194 = xor i32 %193, %191
  %195 = xor i32 %194, %187
  %196 = bitcast i32 %195 to float
  %197 = fneg float %181
  %198 = select i1 %189, float %185, float %197
  %199 = bitcast float %198 to i32
  %200 = xor i32 %187, %199
  %201 = bitcast i32 %200 to float
  %202 = tail call i1 @llvm.amdgcn.class.f32(float %57, i32 504)
  %203 = select i1 %202, float %201, float 0x7FF8000000000000
  %204 = select i1 %202, float %196, float 0x7FF8000000000000
  store float %204, float addrspace(1)* %51, align 4, !tbaa !7
  store float %203, float addrspace(1)* %56, align 4, !tbaa !7
  br label %205

205:                                              ; preds = %12, %173, %33
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
