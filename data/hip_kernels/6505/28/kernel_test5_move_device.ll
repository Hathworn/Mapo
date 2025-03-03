; ModuleID = '../data/hip_kernels/6505/28/main.cu'
source_filename = "../data/hip_kernels/6505/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17kernel_test5_movePcS_(i8 addrspace(1)* %0, i8 addrspace(1)* readnone %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = shl i32 %3, 20
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %5
  %7 = bitcast i8 addrspace(1)* %6 to i32 addrspace(1)*
  %8 = icmp ult i8 addrspace(1)* %6, %1
  br i1 %8, label %9, label %221

9:                                                ; preds = %2
  %10 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 524288
  %11 = bitcast i8 addrspace(1)* %10 to i32 addrspace(1)*
  br label %12

12:                                               ; preds = %12, %9
  %13 = phi i32 [ 0, %9 ], [ %93, %12 ]
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !4
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %14
  store i32 %16, i32 addrspace(1)* %17, align 4, !tbaa !4
  %18 = or i32 %13, 1
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !4
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %19
  store i32 %21, i32 addrspace(1)* %22, align 4, !tbaa !4
  %23 = or i32 %13, 2
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !4
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %24
  store i32 %26, i32 addrspace(1)* %27, align 4, !tbaa !4
  %28 = or i32 %13, 3
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !4
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %29
  store i32 %31, i32 addrspace(1)* %32, align 4, !tbaa !4
  %33 = or i32 %13, 4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !4
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %34
  store i32 %36, i32 addrspace(1)* %37, align 4, !tbaa !4
  %38 = or i32 %13, 5
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !4
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %39
  store i32 %41, i32 addrspace(1)* %42, align 4, !tbaa !4
  %43 = or i32 %13, 6
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !4
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %44
  store i32 %46, i32 addrspace(1)* %47, align 4, !tbaa !4
  %48 = or i32 %13, 7
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !4
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %49
  store i32 %51, i32 addrspace(1)* %52, align 4, !tbaa !4
  %53 = or i32 %13, 8
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !4
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %54
  store i32 %56, i32 addrspace(1)* %57, align 4, !tbaa !4
  %58 = or i32 %13, 9
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !4
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %59
  store i32 %61, i32 addrspace(1)* %62, align 4, !tbaa !4
  %63 = or i32 %13, 10
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !4
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %64
  store i32 %66, i32 addrspace(1)* %67, align 4, !tbaa !4
  %68 = or i32 %13, 11
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !4
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %69
  store i32 %71, i32 addrspace(1)* %72, align 4, !tbaa !4
  %73 = or i32 %13, 12
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !4
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %74
  store i32 %76, i32 addrspace(1)* %77, align 4, !tbaa !4
  %78 = or i32 %13, 13
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !4
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %79
  store i32 %81, i32 addrspace(1)* %82, align 4, !tbaa !4
  %83 = or i32 %13, 14
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !4
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %84
  store i32 %86, i32 addrspace(1)* %87, align 4, !tbaa !4
  %88 = or i32 %13, 15
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !4
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %89
  store i32 %91, i32 addrspace(1)* %92, align 4, !tbaa !4
  %93 = add nuw nsw i32 %13, 16
  %94 = icmp eq i32 %93, 131072
  br i1 %94, label %95, label %12, !llvm.loop !8

95:                                               ; preds = %12, %95
  %96 = phi i32 [ %180, %95 ], [ 0, %12 ]
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !4
  %100 = add nuw nsw i32 %96, 8
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %101
  store i32 %99, i32 addrspace(1)* %102, align 4, !tbaa !4
  %103 = or i32 %96, 1
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !4
  %107 = add nuw nsw i32 %96, 9
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %108
  store i32 %106, i32 addrspace(1)* %109, align 4, !tbaa !4
  %110 = or i32 %96, 2
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !4
  %114 = add nuw nsw i32 %96, 10
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %115
  store i32 %113, i32 addrspace(1)* %116, align 4, !tbaa !4
  %117 = or i32 %96, 3
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %118
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !4
  %121 = add nuw nsw i32 %96, 11
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %122
  store i32 %120, i32 addrspace(1)* %123, align 4, !tbaa !4
  %124 = add nuw nsw i32 %96, 4
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !4
  %128 = add nuw nsw i32 %96, 12
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %129
  store i32 %127, i32 addrspace(1)* %130, align 4, !tbaa !4
  %131 = add nuw nsw i32 %96, 5
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %132
  %134 = load i32, i32 addrspace(1)* %133, align 4, !tbaa !4
  %135 = add nuw nsw i32 %96, 13
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %136
  store i32 %134, i32 addrspace(1)* %137, align 4, !tbaa !4
  %138 = add nuw nsw i32 %96, 6
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %139
  %141 = load i32, i32 addrspace(1)* %140, align 4, !tbaa !4
  %142 = add nuw nsw i32 %96, 14
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %143
  store i32 %141, i32 addrspace(1)* %144, align 4, !tbaa !4
  %145 = add nuw nsw i32 %96, 7
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !4
  %149 = add nuw nsw i32 %96, 15
  %150 = zext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %150
  store i32 %148, i32 addrspace(1)* %151, align 4, !tbaa !4
  %152 = add nuw nsw i32 %96, 8
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %153
  %155 = load i32, i32 addrspace(1)* %154, align 4, !tbaa !4
  %156 = add nuw nsw i32 %96, 16
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %157
  store i32 %155, i32 addrspace(1)* %158, align 4, !tbaa !4
  %159 = add nuw nsw i32 %96, 9
  %160 = zext i32 %159 to i64
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %160
  %162 = load i32, i32 addrspace(1)* %161, align 4, !tbaa !4
  %163 = add nuw nsw i32 %96, 17
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %164
  store i32 %162, i32 addrspace(1)* %165, align 4, !tbaa !4
  %166 = add nuw nsw i32 %96, 10
  %167 = zext i32 %166 to i64
  %168 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %167
  %169 = load i32, i32 addrspace(1)* %168, align 4, !tbaa !4
  %170 = add nuw nsw i32 %96, 18
  %171 = zext i32 %170 to i64
  %172 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %171
  store i32 %169, i32 addrspace(1)* %172, align 4, !tbaa !4
  %173 = add nuw nsw i32 %96, 11
  %174 = zext i32 %173 to i64
  %175 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %174
  %176 = load i32, i32 addrspace(1)* %175, align 4, !tbaa !4
  %177 = add nuw nsw i32 %96, 19
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %178
  store i32 %176, i32 addrspace(1)* %179, align 4, !tbaa !4
  %180 = add nuw nsw i32 %96, 12
  %181 = icmp eq i32 %180, 131064
  br i1 %181, label %182, label %95, !llvm.loop !10

182:                                              ; preds = %95
  %183 = getelementptr inbounds i8, i8 addrspace(1)* %10, i64 524256
  %184 = bitcast i8 addrspace(1)* %183 to i32 addrspace(1)*
  %185 = load i32, i32 addrspace(1)* %184, align 4, !tbaa !4
  store i32 %185, i32 addrspace(1)* %7, align 4, !tbaa !4
  %186 = getelementptr inbounds i8, i8 addrspace(1)* %10, i64 524260
  %187 = bitcast i8 addrspace(1)* %186 to i32 addrspace(1)*
  %188 = load i32, i32 addrspace(1)* %187, align 4, !tbaa !4
  %189 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 4
  %190 = bitcast i8 addrspace(1)* %189 to i32 addrspace(1)*
  store i32 %188, i32 addrspace(1)* %190, align 4, !tbaa !4
  %191 = getelementptr inbounds i8, i8 addrspace(1)* %10, i64 524264
  %192 = bitcast i8 addrspace(1)* %191 to i32 addrspace(1)*
  %193 = load i32, i32 addrspace(1)* %192, align 4, !tbaa !4
  %194 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 8
  %195 = bitcast i8 addrspace(1)* %194 to i32 addrspace(1)*
  store i32 %193, i32 addrspace(1)* %195, align 4, !tbaa !4
  %196 = getelementptr inbounds i8, i8 addrspace(1)* %10, i64 524268
  %197 = bitcast i8 addrspace(1)* %196 to i32 addrspace(1)*
  %198 = load i32, i32 addrspace(1)* %197, align 4, !tbaa !4
  %199 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 12
  %200 = bitcast i8 addrspace(1)* %199 to i32 addrspace(1)*
  store i32 %198, i32 addrspace(1)* %200, align 4, !tbaa !4
  %201 = getelementptr inbounds i8, i8 addrspace(1)* %10, i64 524272
  %202 = bitcast i8 addrspace(1)* %201 to i32 addrspace(1)*
  %203 = load i32, i32 addrspace(1)* %202, align 4, !tbaa !4
  %204 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 16
  %205 = bitcast i8 addrspace(1)* %204 to i32 addrspace(1)*
  store i32 %203, i32 addrspace(1)* %205, align 4, !tbaa !4
  %206 = getelementptr inbounds i8, i8 addrspace(1)* %10, i64 524276
  %207 = bitcast i8 addrspace(1)* %206 to i32 addrspace(1)*
  %208 = load i32, i32 addrspace(1)* %207, align 4, !tbaa !4
  %209 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 20
  %210 = bitcast i8 addrspace(1)* %209 to i32 addrspace(1)*
  store i32 %208, i32 addrspace(1)* %210, align 4, !tbaa !4
  %211 = getelementptr inbounds i8, i8 addrspace(1)* %10, i64 524280
  %212 = bitcast i8 addrspace(1)* %211 to i32 addrspace(1)*
  %213 = load i32, i32 addrspace(1)* %212, align 4, !tbaa !4
  %214 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 24
  %215 = bitcast i8 addrspace(1)* %214 to i32 addrspace(1)*
  store i32 %213, i32 addrspace(1)* %215, align 4, !tbaa !4
  %216 = getelementptr inbounds i8, i8 addrspace(1)* %10, i64 524284
  %217 = bitcast i8 addrspace(1)* %216 to i32 addrspace(1)*
  %218 = load i32, i32 addrspace(1)* %217, align 4, !tbaa !4
  %219 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 28
  %220 = bitcast i8 addrspace(1)* %219 to i32 addrspace(1)*
  store i32 %218, i32 addrspace(1)* %220, align 4, !tbaa !4
  br label %221

221:                                              ; preds = %182, %2
  ret void
}

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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
