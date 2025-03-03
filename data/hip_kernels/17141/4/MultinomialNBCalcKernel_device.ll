; ModuleID = '../data/hip_kernels/17141/4/main.cu'
source_filename = "../data/hip_kernels/17141/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23MultinomialNBCalcKernelPKfPKiPfS3_jjj(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = icmp ult i32 %16, %6
  %18 = icmp ne i32 %4, 0
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %228

20:                                               ; preds = %7
  %21 = icmp eq i32 %16, 0
  br i1 %21, label %27, label %22

22:                                               ; preds = %20
  %23 = and i32 %4, 3
  %24 = icmp ult i32 %4, 4
  br i1 %24, label %205, label %25

25:                                               ; preds = %22
  %26 = and i32 %4, -4
  br label %32

27:                                               ; preds = %20
  %28 = and i32 %4, 3
  %29 = icmp ult i32 %4, 4
  br i1 %29, label %178, label %30

30:                                               ; preds = %27
  %31 = and i32 %4, -4
  br label %97

32:                                               ; preds = %32, %25
  %33 = phi i32 [ 0, %25 ], [ %94, %32 ]
  %34 = phi i32 [ 0, %25 ], [ %95, %32 ]
  %35 = zext i32 %33 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = mul i32 %33, %6
  %39 = add i32 %38, %16
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !11
  %43 = mul i32 %37, %6
  %44 = add i32 %43, %16
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !11
  %48 = fadd contract float %42, %47
  store float %48, float addrspace(1)* %46, align 4, !tbaa !11
  %49 = or i32 %33, 1
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !6
  %53 = mul i32 %49, %6
  %54 = add i32 %53, %16
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !11
  %58 = mul i32 %52, %6
  %59 = add i32 %58, %16
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !11
  %63 = fadd contract float %57, %62
  store float %63, float addrspace(1)* %61, align 4, !tbaa !11
  %64 = or i32 %33, 2
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = mul i32 %64, %6
  %69 = add i32 %68, %16
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !11
  %73 = mul i32 %67, %6
  %74 = add i32 %73, %16
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !11
  %78 = fadd contract float %72, %77
  store float %78, float addrspace(1)* %76, align 4, !tbaa !11
  %79 = or i32 %33, 3
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = mul i32 %79, %6
  %84 = add i32 %83, %16
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !11
  %88 = mul i32 %82, %6
  %89 = add i32 %88, %16
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !11
  %93 = fadd contract float %87, %92
  store float %93, float addrspace(1)* %91, align 4, !tbaa !11
  %94 = add nuw i32 %33, 4
  %95 = add i32 %34, 4
  %96 = icmp eq i32 %95, %26
  br i1 %96, label %205, label %32, !llvm.loop !13

97:                                               ; preds = %97, %30
  %98 = phi i32 [ 0, %30 ], [ %175, %97 ]
  %99 = phi i32 [ 0, %30 ], [ %176, %97 ]
  %100 = zext i32 %98 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !6
  %103 = mul i32 %98, %6
  %104 = add i32 %103, %16
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !11
  %108 = mul i32 %102, %6
  %109 = add i32 %108, %16
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !11
  %113 = fadd contract float %107, %112
  store float %113, float addrspace(1)* %111, align 4, !tbaa !11
  %114 = zext i32 %102 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %3, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !11
  %117 = fadd contract float %116, 1.000000e+00
  store float %117, float addrspace(1)* %115, align 4, !tbaa !11
  %118 = or i32 %98, 1
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = mul i32 %118, %6
  %123 = add i32 %122, %16
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !11
  %127 = mul i32 %121, %6
  %128 = add i32 %127, %16
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %2, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !11
  %132 = fadd contract float %126, %131
  store float %132, float addrspace(1)* %130, align 4, !tbaa !11
  %133 = zext i32 %121 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %3, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !11
  %136 = fadd contract float %135, 1.000000e+00
  store float %136, float addrspace(1)* %134, align 4, !tbaa !11
  %137 = or i32 %98, 2
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %138
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !6
  %141 = mul i32 %137, %6
  %142 = add i32 %141, %16
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !11
  %146 = mul i32 %140, %6
  %147 = add i32 %146, %16
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %2, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !11
  %151 = fadd contract float %145, %150
  store float %151, float addrspace(1)* %149, align 4, !tbaa !11
  %152 = zext i32 %140 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %3, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !11
  %155 = fadd contract float %154, 1.000000e+00
  store float %155, float addrspace(1)* %153, align 4, !tbaa !11
  %156 = or i32 %98, 3
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %157
  %159 = load i32, i32 addrspace(1)* %158, align 4, !tbaa !7, !amdgpu.noclobber !6
  %160 = mul i32 %156, %6
  %161 = add i32 %160, %16
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !11
  %165 = mul i32 %159, %6
  %166 = add i32 %165, %16
  %167 = zext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %2, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !11
  %170 = fadd contract float %164, %169
  store float %170, float addrspace(1)* %168, align 4, !tbaa !11
  %171 = zext i32 %159 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %3, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !11
  %174 = fadd contract float %173, 1.000000e+00
  store float %174, float addrspace(1)* %172, align 4, !tbaa !11
  %175 = add nuw i32 %98, 4
  %176 = add i32 %99, 4
  %177 = icmp eq i32 %176, %31
  br i1 %177, label %178, label %97, !llvm.loop !13

178:                                              ; preds = %97, %27
  %179 = phi i32 [ 0, %27 ], [ %175, %97 ]
  %180 = icmp eq i32 %28, 0
  br i1 %180, label %228, label %181

181:                                              ; preds = %178, %181
  %182 = phi i32 [ %202, %181 ], [ %179, %178 ]
  %183 = phi i32 [ %203, %181 ], [ 0, %178 ]
  %184 = zext i32 %182 to i64
  %185 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %184
  %186 = load i32, i32 addrspace(1)* %185, align 4, !tbaa !7, !amdgpu.noclobber !6
  %187 = mul i32 %182, %6
  %188 = add i32 %187, %16
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !11
  %192 = mul i32 %186, %6
  %193 = add i32 %192, %16
  %194 = zext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %2, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !11
  %197 = fadd contract float %191, %196
  store float %197, float addrspace(1)* %195, align 4, !tbaa !11
  %198 = zext i32 %186 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %3, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !11
  %201 = fadd contract float %200, 1.000000e+00
  store float %201, float addrspace(1)* %199, align 4, !tbaa !11
  %202 = add nuw i32 %182, 1
  %203 = add i32 %183, 1
  %204 = icmp eq i32 %203, %28
  br i1 %204, label %228, label %181, !llvm.loop !15

205:                                              ; preds = %32, %22
  %206 = phi i32 [ 0, %22 ], [ %94, %32 ]
  %207 = icmp eq i32 %23, 0
  br i1 %207, label %228, label %208

208:                                              ; preds = %205, %208
  %209 = phi i32 [ %225, %208 ], [ %206, %205 ]
  %210 = phi i32 [ %226, %208 ], [ 0, %205 ]
  %211 = zext i32 %209 to i64
  %212 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %211
  %213 = load i32, i32 addrspace(1)* %212, align 4, !tbaa !7, !amdgpu.noclobber !6
  %214 = mul i32 %209, %6
  %215 = add i32 %214, %16
  %216 = zext i32 %215 to i64
  %217 = getelementptr inbounds float, float addrspace(1)* %0, i64 %216
  %218 = load float, float addrspace(1)* %217, align 4, !tbaa !11
  %219 = mul i32 %213, %6
  %220 = add i32 %219, %16
  %221 = zext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %2, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !11
  %224 = fadd contract float %218, %223
  store float %224, float addrspace(1)* %222, align 4, !tbaa !11
  %225 = add nuw i32 %209, 1
  %226 = add i32 %210, 1
  %227 = icmp eq i32 %226, %23
  br i1 %227, label %228, label %208, !llvm.loop !17

228:                                              ; preds = %181, %178, %208, %205, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !16}
